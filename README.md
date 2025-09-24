## Project Overview

### Objective
Build a small service/app that:  
1. Ingests sample SMS/email text about transactions.  
2. Parses & normalizes into a transactions table (SQLite only).  
3. Classifies each transaction type via a TF-Lite model (or rule-based stub).  
4. Computes impact on a demo goal (e.g., “Savings reduced” or “Bill due soon”).  
5. Exposes APIs (Python FastAPI) or a Flutter UI that shows stored transactions + impacts.

### Provided Data
- **SMS:** `data/sms.txt`  
- **Email:** `data/email.txt`  

---

## Database Schema (SQLite)

### `transactions` Table
| Column        | Type        | Description |
|---------------|------------|------------|
| id            | TEXT/UUID  | Primary key |
| user_id       | TEXT       | Hardcoded `"demo-user"` |
| ts            | TIMESTAMP  | UTC timestamp |
| amount        | NUMERIC    | Transaction amount |
| currency      | TEXT       | Currency code |
| account_ref   | TEXT       | Account or card reference |
| channel       | TEXT       | `"sms"` | `"email"` |
| raw_msg_id    | TEXT       | Hash of raw line |
| hash          | TEXT       | Idempotency key |
| type          | TEXT       | `"credit" | "debit" | "bill" | "fee" | "other"` |
| category      | TEXT       | e.g., `"shopping"`, `"utilities"` |
| confidence    | REAL       | Classification confidence |
| meta          | JSON       | Arbitrary details (merchant, last4, refs) |

### `goal_impacts` Table
| Column           | Type        | Description |
|-----------------|------------|------------|
| id               | TEXT/UUID  | Primary key |
| transaction_id   | TEXT (fk)  | Linked transaction |
| goal_id          | TEXT       | e.g., `"demo-savings"` |
| impact_score     | REAL       | -1..+1 |
| message          | TEXT       | Human-readable impact |
| created_at       | TIMESTAMP  | Timestamp |

---
📺 Screenshots

<img width="700" height="500" alt="Screenshot 2025-09-23 162222" src="https://github.com/user-attachments/assets/d297b85f-5453-4fc9-b504-a38f051c2a0a" />

<img width="700" height="500" alt="Screenshot 2025-09-23 162300" src="https://github.com/user-attachments/assets/f44bac1f-158e-4ca8-a05a-0ef04b61cb34" />


## Functional Requirements Implemented
- **Ingestion:** Reads `sms.txt` and `email.txt` to insert normalized rows.  
- **Parsing:** Extracts `{amount, merchant, account_ref, date/time}` using regex.  
- **Classification:** `classify(message)` interface implemented (TF-Lite stub).  
- **Goal Impact:** Debit → negative savings, Credit → positive, Bill → due-date warning.  
- **API/UI:** FastAPI backend; optional Flutter frontend showing results.

---

## Non-Functional Notes
- **Secrets:** Loaded from environment variables only.  
- **PII Masking:** Account/card numbers masked in logs.  
- **Security & Scalability:** See `THREAT_MODEL.md` (PII leaks, SQL injection, API misuse).  
- **Database Migration:** SQLite → Postgres migration path documented.  

---

## Tech Stack
- **Backend:** Python 3.10+, FastAPI  
- **Database:** SQLite  
- **Frontend:** Flutter (optional)  
- **ML:** TensorFlow Lite stub provided  

---

## Project Structure

### Backend: `transaction_service/`
- `src/`
  - `main.py` → FastAPI entrypoint
  - `models.py` → Pydantic models for API
  - `db.py` → SQLite connection & table creation
  - `ingest.py` → Functions to read `sms.txt` / `email.txt` and insert
  - `classify.py` → `classify(message)` stub for TF-Lite
  - `goal_impact.py` → Compute impact on goals
- `data/`
  - `sms.txt`
  - `email.txt`

### Frontend: `transaction_ui/`
- `lib/`
  - `main.dart`
  - `models/transaction.dart`
  - `services/api_service.dart`

---

## Deliverables
- `/src` code (backend)  
- `/data` with sample text  
- `/tests` with at least 3 small tests  
- `README.md` (this file)  
- `DISCLOSURE.md` & `THREAT_MODEL.md`  
- Run backend:  
```bash
python -m uvicorn src.main:app --reload

---
📺 Screenshots

<img width="700" height="500" alt="Screenshot 2025-09-23 162222" src="https://github.com/user-attachments/assets/d297b85f-5453-4fc9-b504-a38f051c2a0a" />

<img width="700" height="500" alt="Screenshot 2025-09-23 162300" src="https://github.com/user-attachments/assets/f44bac1f-158e-4ca8-a05a-0ef04b61cb34" />


## 🚀 Getting Started

### 1. Backend (FastAPI)

1. Navigate to the backend folder:

```bash
cd transaction_service

Create and activate virtual environment:

python -m venv venv
# Windows PowerShell
.\venv\Scripts\Activate.ps1
# Windows CMD
venv\Scripts\activate.bat


Install dependencies:

pip install fastapi uvicorn pydantic


Run the backend:

python -m uvicorn src.main:app --reload


Backend will run at http://127.0.0.1:8000

Endpoints:

GET /transactions – fetch all transactions

POST /ingest/sms – ingest SMS messages

POST /ingest/email – ingest Email messages

GET /goal_impacts – fetch goal impacts

2. Frontend (Flutter)

Navigate to the Flutter project folder:

cd transaction_ui


Get Flutter dependencies:

flutter pub get


Run the app (choose your device or Chrome):

flutter run

🔧 How to Use

Start backend.

Ingest sample data via:

# SMS
POST /ingest/sms

# Email
POST /ingest/email


Fetch transactions via:

GET /transactions


Flutter app will fetch and display transactions and goal impacts.



