# Open Questions & Decisions Required

Before any coding begins, I need your confirmation or decisions regarding the following open questions. Your answers will determine the exact execution of the project.

### 1. Cities / Locations Management

Currently, I suggested making the "City" field a simple text input or a hard-coded dropdown array for simplicity. Do you want it this way, or do you prefer a dedicated `cities` database table so the Admin can add/remove cities dynamically?

### 2. Deleting Workshop Accounts

If an admin bans or deletes a workshop account, should all their posts and images be completely erased from the server, or just hidden (Soft Delete) to maintain statistical data?

### 3. Contact Methods

Is WhatsApp the absolute primary contact method? Should we force workshop owners to provide a WhatsApp number during registration, or is a regular phone call sufficient if they don't have WhatsApp?

### 4. Admin Account Creation

Since there is no public "Admin Registration" page for security, I will manually inject the first Admin user into the database via an SQL seed. Is that acceptable for Phase 1?

### 5. Deployment Setup

Have you already purchased a hosting plan and domain, or will we test entirely on local WAMP stack until the MVP is fully complete?

---
**Please review the documentation in the `/docs/` folder.**
**If you approve the overall design, answer the open questions above so we can confidently proceed with the Database implementation and Coding phases!**
