# Loja - Exercício de Desenvolvimento

Este projeto simula uma loja de departamentos com funcionalidades para gerenciar produtos e categorias de produtos por meio de uma API.

## Estrutura do Projeto

### Namespace
As classes relacionadas aos produtos e categorias devem ser criadas na pasta `source/Model/Store`:
- **Product.php**: Representa a tabela `products` do banco de dados.
- **ProductCategory.php**: Representa a tabela `products_categories` do banco de dados.

Ambas as classes devem herdar da classe `Model`.

### API
A pasta `api` contém os scripts responsáveis por expor os endpoints da API. Todos os retornos devem ser no formato JSON.

#### Endpoints de Produtos
1. **`products-find-all.php`**  
   Lista todos os produtos.

2. **`products-find-by-id.php`**  
   Lista um produto específico com base no `id` passado como parâmetro via `$_GET`.

3. **`products-insert.php`**  
   Insere um novo produto. Os dados do produto devem ser enviados como parâmetros via `$_GET`.

4. **`products-update-by-id.php`**  
   Atualiza os dados de um produto existente. O `id` do produto e os novos dados devem ser passados como parâmetros via `$_GET`.

5. **`products-delete-by-id.php`**  
   Exclui um produto com base no `id` passado como parâmetro via `$_GET`.

#### Endpoints de Categorias de Produtos
1. **`products-categories-find-all.php`**  
   Lista todas as categorias de produtos.

2. **`products-categories-insert.php`**  
   Insere uma nova categoria de produto. Os dados devem ser enviados como parâmetros via `$_GET`.

3. **`products-categories-update-by-id.php`**  
   Atualiza os dados de uma categoria existente. O `id` da categoria e os novos dados devem ser passados como parâmetros via `$_GET`.

4. **`products-categories-delete-by-id.php`**  
   Exclui uma categoria com base no `id` passado como parâmetro via `$_GET`.

## Exemplos de Uso
### Listar todos os produtos
**Requisição**: `GET /api/products-find-all.php`

**Resposta**:
```json
[
    {
        "id": 1,
        "idCategory": 1,
        "name": "Smartphone",
        "price": 1500.00
    },
    {
        "id": 2,
        "idCategory": 1,
        "name": "Notebook",
        "price": 3500.00
    }
]
```
### Inserir um novo produto
**Requisição**: `GET /api/products-insert.php?idCategory=1&name=Tablet&price=2000.00`

**Resposta**:
```json
{
    "status": "success",
    "message": "Produto inserido com sucesso."
}
```