<?php

namespace Source\Core;

use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use \DateTimeImmutable;
use \Exception;

class JWTToken
{
    private $secretKey = "sequencia_que_ninguém_conhece";
    private $headerJWT = "HS512";
    private $url = "http://localhost:8080/inf-3at-2025";

    public function create($payLoad): string
    {
        $tokenId    = base64_encode(random_bytes(16));
        $issuedAt   = new DateTimeImmutable();
        $expire     = $issuedAt->modify('+90 minutes')->getTimestamp(); // 60 minutos

        // Create the token as an array
        $data = [
            'iat'  => $issuedAt->getTimestamp(), // Issued at: time when the token was generated
            'jti'  => $tokenId,                  // Json Token Id: an unique identifier for the token
            'iss'  => $this->url,                // Issuer
            'nbf'  => $issuedAt->getTimestamp(), // Not before
            'exp'  => $expire,                   // Expire
            'data' => $payLoad
        ];

        // Encode the array to a JWT string.
        return JWT::encode(
            $data,         //Data to be encoded in the JWT
            $this->secretKey, // The signing key
            $this->headerJWT  // Algorithm used to sign the token, see https://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms-40#section-3
        );
    }

    public function decode($token): bool | object
    {
        try {
            $token = JWT::decode($token, new Key($this->secretKey, $this->headerJWT));
            $now = new DateTimeImmutable();
            $serverName = $this->url;

            if ($token->iss !== $serverName || $token->nbf > $now->getTimestamp() || $token->exp < $now->getTimestamp())
            {
                return false;
            }
            return $token;
        } catch (Exception) {
            return false;
        }
    }

}
