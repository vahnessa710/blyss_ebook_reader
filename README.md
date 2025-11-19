
# Blyss Ebook Reader | 2025

![2](https://github.com/user-attachments/assets/50e46be8-63e1-415a-9c07-e1eb59a06b71)
![Screenshot 2025-07-01 020244](https://github.com/user-attachments/assets/ff620b57-c72d-4eb0-a83f-e89163970e5e)

Blyss is a desktop-focused ebook reader that lets you discover books via Gutendex API, track your reading progress, look up definitions, and take notes - all in one place.

A modern, dockerized ebook reader application built with Ruby on Rails that allows authenticated users to search, read, and manage ebooks, with persistent reading progress, in-app dictionary, and note-taking features.

## 🛠️ Built With

- **Ruby on Rails** (Backend)
    
- **PostgreSQL** (Database)
    
- **Devise** (Authentication)
    
- **Gutendex and Free Dictionary API** (External Data)
    
- **Tailwind CSS** (Styling)
    
- **Docker** (Containerization)
    

## ✨ Features

- Secure user authentication and email verification using Devise with Confirmable
    
- Search, read, and manage ebooks with persistent reading progress
    
- In-app dictionary integration with Free Dictionary API
    
- Note-taking capabilities
    
- Interactive features with Stimulus.js
    
- Clean desktop-focused UI styled with Tailwind CSS
    
- **Note**: Currently optimized for desktop use

## Current Limitations

- Mobile responsiveness not yet implemented
    
- Best experienced on desktop devices

## Prerequisites

- Docker
- Docker Compose
- Git

## Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/vahnessa710/blyss_ebook_reader.git
   cd blyss_ebook_reader
   ```

2. **Build and start the application**
   ```bash
   docker compose up --build
   ```
   *This automatically runs database setup (migrations + seeds) via the `db:prepare` command*

3. **Access the application**
   - Open your browser and go to `http://localhost:3000`
   - Use the pre-seeded user accounts (see [Seeded Users](#seeded-users) section)

4. **Stop the application**
   ```bash
   docker compose down
   ```

## SMTP Configuration (Required for Account Registration)

To enable user registration and email confirmation features, you need to configure SMTP settings. This allows the app to send confirmation emails when users sign up and enables the "resend confirmation email" functionality.

### Option 1: Using .env file (Recommended)

Create a `.env` file in the project root with your SMTP credentials:

```bash
# Gmail Example
SMTP_ADDRESS=smtp.gmail.com
SMTP_PORT=587
SMTP_USER_NAME=your_email@gmail.com
SMTP_PASSWORD=your_app_password
```

### Option 2: Docker Compose Environment Variables

You can also set SMTP credentials directly in the `docker-compose.yml` file under the web service:

```yaml
environment:
  SMTP_ADDRESS: smtp.gmail.com
  SMTP_PORT: 587
  SMTP_USER_NAME: your_email@gmail.com
  SMTP_PASSWORD: your_app_password
```

### SMTP Provider Guides

#### Gmail Setup
1. Enable 2-factor authentication on your Google account
2. Generate an App Password:
   - Go to Google Account settings
   - Security → 2-Step Verification → App passwords
   - Generate a password for "Mail"
   - Use this 16-character password as `SMTP_PASSWORD`

**Note**: Without SMTP configuration, new users won't be able to complete registration as confirmation emails cannot be sent.
## Seeded Users

The application comes with pre-configured user accounts for testing. These accounts are already email-confirmed and ready to use:

**User:**
- Email: `vahnessa@email.com`
- Password: `password`
- Status: Email already confirmed

## Development

### Running the Application

```bash
# Standard development build (uses Dockerfile.dev)
docker compose up --build

```
### Common Development Commands

```bash
# Access Rails console
docker compose exec web rails console

# View logs
docker compose logs web
```

## Project Structure

```
blyss_ebook_reader/
├── app/                 # Rails application code
├── config/             # Configuration files
├── db/                 # Database migrations and seeds
├── docker-compose.yml  # Docker Compose configuration
├── Dockerfile          # Production Dockerfile
├── Dockerfile.dev      # Development Dockerfile
└── README.md          # This file
```

## Troubleshooting

### Common Issues

1. **Port already in use**
   ```bash
   # Stop any existing Rails servers
   sudo lsof -ti:3000 | xargs kill -9
   ```

2. **Docker build issues**
   ```bash
   # Clean Docker cache and rebuild
   docker compose down -v
   docker compose up --build
   ```

3. **Database connection errors**
   ```bash
   # Complete reset
   docker compose down -v
   docker compose up --build
   ```

4. **"service not running" errors**
   ```bash
   # Make sure containers are running first
   docker compose up
   # Then in another terminal, run your command
   docker compose exec web rails db:reset
   ```

5. **SMTP not working**
   - Verify environment variables are set correctly
   - Check if your SMTP provider requires app passwords
   - Ensure the SMTP server address and port are correct

### Logs

View application logs:
```bash
docker compose logs web
```

View database logs:
```bash
docker compose logs db
```

## Support

If you encounter any issues:
1. Check the troubleshooting section above
2. Ensure all prerequisites are installed
3. Verify SMTP configuration if **account registration/confirmation emails** aren't working
4. Check the application logs for detailed error messages

---

**Note**: The SMTP configuration is required for user registration functionality. Without it, new users cannot receive confirmation emails and won't be able to activate their accounts.
