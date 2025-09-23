# Transaction App

A small service/app to ingest SMS/email transaction messages, normalize them, classify, and compute impacts on demo goals. Built with **FastAPI** backend and optional **Flutter** frontend.

---

## 📂 Project Structure
transaction_service/
├─ src/
│ ├─ main.py # FastAPI entrypoint
│ ├─ models.py # Pydantic models for API
│ ├─ db.py # SQLite connection & table creation
│ ├─ ingest.py # Functions to read sms.txt/email.txt and insert
│ ├─ classify.py # classify(message) stub for TF-Lite
│ └─ goal_impact.py # Compute impact on goals
├─ data/
│ ├─ sms.txt
│ └─ email.txt

transaction_ui/
├─ lib/
│ ├─ main.dart
│ ├─ models/transaction.dart
│ └─ services/api_service.dart


---

## ⚡ Features

- Ingest sample SMS/email text about transactions.
- Parse & normalize messages into a SQLite transactions table.
- Classify each transaction type (`credit`, `debit`, `bill`, etc.) using TF-Lite or baseline stub.
- Compute impact on a demo goal (e.g., savings, bill due alerts).
- Expose APIs via FastAPI backend.
- Optional Flutter frontend displays stored transactions and impacts.

---

## 🛠️ Tech Stack

- **Backend:** Python 3.10+, FastAPI
- **Frontend:** Flutter (optional)
- **Database:** SQLite
- **ML:** TensorFlow Lite (stub interface provided)

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



