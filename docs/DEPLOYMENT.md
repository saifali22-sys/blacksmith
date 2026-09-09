# Deployment Plan

## Hosting Environment

Given the project uses standard PHP & MySQL, it does not require a complex containerized (Docker) cloud setup for Phase 1.

A standard **VPS (Virtual Private Server)** or a robust **Shared Hosting** plan using **cPanel / Plesk** is perfectly adequate. As the platform scales, migration to AWS or DigitalOcean with load balancers can be considered.

### Specifications Required

* **Web Server:** Apache (with `mod_rewrite` enabled for SEO URLs) or Nginx.
* **Language:** PHP 8.1 or higher (PDO, GD/Imagick, Fileinfo extensions must be active).
* **Database:** MySQL 8.x or MariaDB.

## Deployment Steps (From Local to Production)

1. **Database Migration:**
   * Export the local database structure (`DATABASE_DESIGN.md` translated to SQL statements).
   * Import it into the live MySQL database.
2. **Environment Variables Configuration:**
   * Instead of hardcoding DB passwords in the code, use a `config.php` file or `.env` loader that is ignored by Git. Set production details there.
3. **File Upload:**
   * Upload the `app/`, `public/`, and `storage/` folders.
   * **Crucial step:** Map the web server's Document Root directly to the `public/` folder. The `app/` and `storage/` folders should reside *outside* the public web root for maximum security.
4. **Permissions:**
   * Change permissions for the `public/uploads/` and `storage/logs/` directories to allow PHP to write to them (usually `chmod 755` or `775` depending on user ownership).
5. **SSL Certificate (HTTPS):**
   * Install a free Let's Encrypt SSL certificate. The platform handles user passwords and requires HTTPS to function securely. Let `.htaccess` force redirect HTTP to HTTPS.
