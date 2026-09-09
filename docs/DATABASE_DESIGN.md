# Database Design

The database is designed to be *Normalized* (free of data duplication) and scalable for the future.

## Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    USERS ||--o| WORKSHOPS : "owns"
    USERS {
        int id PK
        string role "admin, owner"
        string email 
        string password_hash
        timestamp created_at
    }

    WORKSHOPS ||--o{ POSTS : "creates"
    WORKSHOPS {
        int id PK
        int user_id FK
        string name
        string description
        string logo_path
        string phone_number
        string city
        timestamp created_at
    }

    CATEGORIES ||--o{ POSTS : "categorizes"
    CATEGORIES {
        int id PK
        string name "Doors, Windows, etc"
        string icon_path
        boolean is_active
    }

    POSTS ||--o{ POST_IMAGES : "has"
    POSTS ||--o{ REPORTS : "receives"
    POSTS {
        int id PK
        int workshop_id FK
        int category_id FK
        string title
        text description
        string dimensions
        string price
        enum price_type "fixed, on_demand"
        boolean is_active
        timestamp created_at
        timestamp updated_at
    }

    POST_IMAGES {
        int id PK
        int post_id FK
        string image_path
        boolean is_main
    }

    REPORTS {
        int id PK
        int post_id FK
        string reason
        text additional_details
        enum status "pending, resolved, dismissed"
        timestamp created_at
    }
```

## Tables and Details

### 1. `users` Table

Stores login credentials for partners (admins and workshop owners). Regular customers do not have records as they are unregistered visitors.

* `id`: Primary Key.
* `role`: Determines the user type: 'admin' or 'owner'.
* `email`: Used for contact and login authentication (Unique).
* `password_hash`: Safely stores the password using Bcrypt.

### 2. `workshops` Table

Contains the Profile of each workshop which will be shown to visitors.

* `user_id`: Foreign Key from the `users` table. (One-to-One relationship).
* `city`: Text field (can be separated later into a `locations` table if needed).

### 3. `categories` Table

Types of blacksmith works (only the admin can add them).

* `id`: Primary Key.
* `name`: e.g., Doors, Handrails, Awnings...
* `is_active`: Soft delete mechanism to hide the category while keeping its historical posts.

### 4. `posts` Table (Works & Models)

The core of the platform, every post belongs to a specific workshop.

* `workshop_id`: Foreign Key linking the work to its owner.
* `category_id`: Foreign Key linking the work to a category.
* `price_type`: Choice between `fixed` or `on_demand`.
* `is_active`: Allows the workshop or admin to temporarily pause the visibility of the post.

### 5. `post_images` Table

Since a post can have multiple images, they shouldn't be in the post table directly.

* `post_id`: Foreign Key linking images to a post (One-to-Many).
* `is_main`: A boolean to indicate this is the main cover image shown on thumbnail cards.

### 6. `reports` Table

Stores reports submitted by visitors regarding bad content.

* `post_id`: The reported post.
* `status`: Report status ('pending' review, 'resolved' action taken, 'dismissed' false report).
