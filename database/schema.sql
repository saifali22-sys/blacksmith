-- --------------------------------------------------------
-- Blacksmith Platform Database Schema
-- Character Set: UTF-8 (mb4) for full Unicode/Arabic support
-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS blacksmith_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE blacksmith_db;

-- --------------------------------------------------------
-- 1. USERS TABLE
-- --------------------------------------------------------
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Stores password hash
    phone VARCHAR(50),
    role ENUM('customer', 'workshop_owner', 'admin') NOT NULL DEFAULT 'customer',
    status ENUM('active', 'inactive', 'banned') NOT NULL DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_user_email (email),
    INDEX idx_user_role (role),
    INDEX idx_user_status (status)
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- 2. WORKSHOP PROFILES TABLE
-- --------------------------------------------------------
CREATE TABLE workshop_profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE, -- One-to-One relationship with Users
    workshop_name VARCHAR(255) NOT NULL,
    description TEXT,
    city VARCHAR(100),
    area VARCHAR(100),
    address VARCHAR(255),
    profile_image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_workshop_city (city)
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- 3. CATEGORIES TABLE
-- --------------------------------------------------------
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- 4. WORKS / DESIGNS TABLE
-- --------------------------------------------------------
CREATE TABLE works (
    id INT AUTO_INCREMENT PRIMARY KEY,
    workshop_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    dimensions VARCHAR(255),
    materials VARCHAR(255),
    price DECIMAL(10, 2),
    price_type ENUM('fixed', 'on_demand') NOT NULL DEFAULT 'on_demand',
    location VARCHAR(255),
    status ENUM('active', 'hidden', 'deleted') NOT NULL DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (workshop_id) REFERENCES workshop_profiles(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE RESTRICT,
    INDEX idx_work_workshop (workshop_id),
    INDEX idx_work_category (category_id),
    INDEX idx_work_title (title),
    INDEX idx_work_status (status)
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- 5. WORK IMAGES TABLE
-- --------------------------------------------------------
CREATE TABLE work_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    work_id INT NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (work_id) REFERENCES works(id) ON DELETE CASCADE,
    INDEX idx_image_work (work_id)
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- 6. REPORTS TABLE
-- --------------------------------------------------------
CREATE TABLE reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    work_id INT NOT NULL,
    reason VARCHAR(255) NOT NULL,
    description TEXT,
    status ENUM('pending', 'resolved', 'dismissed') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (work_id) REFERENCES works(id) ON DELETE CASCADE,
    INDEX idx_report_user (user_id),
    INDEX idx_report_work (work_id),
    INDEX idx_report_status (status)
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- SAMPLE SEED DATA
-- --------------------------------------------------------

-- 1. Insert Categories
INSERT INTO categories (name, description, status) VALUES 
('Doors', 'Metal and iron doors suitable for villas and homes.', 'active'),
('Gates', 'Large main gates for parking and entrances.', 'active'),
('Windows', 'Iron window frames and protections.', 'active'),
('Railings', 'Staircase railings and balcony protections.', 'active'),
('Canopies', 'Car parking shades and garden canopies.', 'active');

-- 2. Insert Users (Password: 'password123' bcrypt hash used as example mock)
-- Admin
INSERT INTO users (name, email, password, phone, role) VALUES 
('Super Admin', 'admin@blacksmith.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0790000000', 'admin');

-- Workshop Owner
INSERT INTO users (name, email, password, phone, role) VALUES 
('Ahmad Blacksmith', 'ahmad@workshop.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0791111111', 'workshop_owner');

-- Customer
INSERT INTO users (name, email, password, phone, role) VALUES 
('Omar Customer', 'omar@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0792222222', 'customer');

-- 3. Insert Workshop Profile
INSERT INTO workshop_profiles (user_id, workshop_name, description, city, area, address, profile_image) VALUES 
(2, 'Ahmad Modern Ironworks', 'Specialized in modern laser-cut iron designs.', 'Amman', 'Marka', 'Industrial Area, St. 15', 'uploads/profiles/ahmad_logo.jpg');

-- 4. Insert Works / Designs
INSERT INTO works (workshop_id, category_id, title, description, dimensions, materials, price, price_type, location, status) VALUES 
(1, 1, 'Modern Laser Cut Door', 'High-quality laser-cut main door with glass backing.', '2m x 2.2m', 'Galvanized Steel, Tempered Glass', NULL, 'on_demand', 'Amman', 'active'),
(1, 4, 'Classic Steel Railing', 'Elegant staircase railing suitable for classic villas.', 'Custom', 'Wrought Iron', 45.00, 'fixed', 'Amman', 'active');

-- 5. Insert Work Images
INSERT INTO work_images (work_id, image_path, is_primary) VALUES 
(1, 'uploads/works/door_main.jpg', TRUE),
(1, 'uploads/works/door_side.jpg', FALSE),
(2, 'uploads/works/railing_main.jpg', TRUE);

-- 6. Insert Reports
INSERT INTO reports (user_id, work_id, reason, description, status) VALUES 
(3, 1, 'Inaccurate Dimensions', 'The dimensions stated do not match the standard sizes usually provided.', 'pending');
