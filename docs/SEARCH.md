# Search System

The search functionality is critical for customers who want to rapidly find specific blacksmithing works.

## MVP Search Capabilities (Phase 1)

In the initial release, a standard SQL-based search is sufficient.

### 1. Keyword Search Bar

* A central search bar available in the header.
* Searches across the `posts` table looking at:
  * `title` (e.g., "Modern Door").
  * `description` (Keywords).
* Searches across the `workshops` table looking at:
  * `name` (e.g., "Al-Ahlia Workshop").

SQL Approach (Basic `LIKE` operator):
`SELECT * FROM posts WHERE title LIKE :query OR description LIKE :query`

### 2. Filtering Options

A sidebar or dropdown filter system in the category pages:

* **Category:** Doors, Windows, Awnings, etc.
* **City:** Filter posts by the workshop's city location.
* **Price Type:** Fixed price vs. Price on Demand.

### 3. Pagination

Search results could be massive. The search controller must implement pagination (e.g., 20 results per page) to ensure quick response times and better UI experience.

## Advanced Search Architecture (Future Phases)

As the database grows, standard `LIKE` queries become extremely slow.

When scaling, we should implement a dedicated search engine:

* **Elasticsearch** or **Meilisearch**.
* These tools provide Full-Text Search, Typo Tolerance, Synonyms, and rapid filtering, elevating the customer discovery experience.
