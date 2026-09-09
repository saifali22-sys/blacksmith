# System Architecture

The Blacksmith project is built on the **MVC (Model-View-Controller) Pattern** architecture to ensure the separation of application logic from presentation views and database execution commands.

## Architecture Concepts

1. **Frontend (Views):** Relies on HTML/CSS/JS (fully responsive and RTL supported) without using complex frameworks like React, in order to simplify the project and achieve excellent load speed with Vanilla JS and lightweight libraries.
2. **Backend (Controllers/Models):** Built on raw PHP using OOP and MVC patterns.
3. **Database Layer:** Via PDO (PHP Data Objects) to ensure protection against SQL injection and to support Prepared Statements.

---

## Proposed Folder Structure

Project files will be organized as follows to maintain sustainable maintenance and scalability:

```text
blacksmith_project/
├── app/                        # Contains the core application code
│   ├── Config/                 # System Settings (Database, App Constants)
│   ├── Core/                   # Core App Components (Router, Base Controller, Base Model, Database wrapper)
│   ├── Controllers/            # Route Controllers (Home, Auth, Workshop, Post, Admin)
│   ├── Models/                 # DB Interactions (User, Post, Category, Report)
│   ├── Services/               # Helper Services (ImageUploader, Validator)
│   └── Views/                  # Presentation Templates
│       ├── layouts/            # Base Templates (Header, Footer, AdminLayout)
│       ├── home/               # Public Visitor Pages
│       ├── dashboard/          # Workshop Owner Dashboard Pages
│       ├── admin/              # Admin Dashboard Pages
│       └── components/         # Reusable Components (Cards, Modals)
│
├── public/                     # Public Directory (Document Root for the Web Server)
│   ├── index.php               # Single Entry Point (Front Controller)
│   ├── assets/                 # Frontend Assets
│   │   ├── css/
│   │   ├── js/
│   │   └── fonts/
│   └── uploads/                # Image Upload Directory (Must be secured against executing scripts)
│       ├── posts/              # Work Post Images
│       └── profiles/           # Workshop Logos
│
├── storage/                    # Non-public Server Files (Logs, Drafts)
│   └── logs/                   # Error Logs
│
├── docs/                       # Design and Analysis Documentation (This Directory)
└── .htaccess                   # RewriteRules to redirect everything to index.php and protect folders
```

## Benefits of this Architecture

1. **Security:** The `public` folder is the only one exposed to the user. The rest of the system code in `app` is protected and hidden, and the visitor cannot directly access code files.
2. **Single Entry Point (Front Controller Pattern):** All requests go through `public/index.php`, which in turn passes them to the Router to process and send to the appropriate Controller. This simplifies URL handling (SEO Friendly URLs).
3. **Separation of Concerns:**
   - The Controller handles the incoming Request and performs Validation.
   - The Model retrieves or saves data directly to the Database.
   - The View is responsible only for the final rendering and is completely free of SQL queries or complex business logic.
