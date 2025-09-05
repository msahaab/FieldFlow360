# FieldFlow Django — Quick Reference

## Overview
FieldFlow is an internal operations management system designed to help teams such as Sales, Technicians, and Admins manage and track their operations efficiently. The system focuses on job lifecycle modeling, allowing users to create, manage, and monitor jobs through a series of structured tasks. Each job can be linked to various assets, such as equipment or tools, and tasks, ensuring that all necessary resources are accounted for.

## Getting Started

### Clone the Repository
First, clone the repository using the following command:

```bash
git clone https://github.com/msahaab/FieldFlowAssessment.git
```

---

## Local Setup (dev)
1. **Create your env from the template**
   ```bash
   # from repo root after cloning
   cp .env.example .env
   ```

2. **Start dev**

   ```bash
   docker compose -f docker-compose.dev.yml up --build
   ```

3. **Open**

   * App: `http://localhost:8000/`
   * Docs: `http://localhost:8000/api/docs/`
   
   **Credentials**
   * email: admin@fieldflow.com
   * password: @FieldFlow123@

---

## Production URLs & Routing
* Public URLs:

  * App: `http://<EC2_PUBLIC_IP>/`
  * Docs: `http://<EC2_PUBLIC_IP>/api/docs/`


---

## Docs Endpoint

* Path: **`/api/docs/`**
* Local: `http://localhost:8000/api/docs/`
* Prod: `http://<EC2_PUBLIC_IP>/api/docs/`

Cheers!
