# Close Symptom Events – Bash Project

## 📌 Project Overview

This project simulates a monitoring system scenario where:

- Each **Incident (Ticket)** has a status (opened / closed).
- Each Incident is linked to a specific **Event ID**.
- If an Incident is resolved (closed), the related Event must be closed as well.
- If the Incident is still open, no action is performed.

The script automates this logic using Bash, AWK, and SED.

---

## 🗂 Project Structure

ITI-Bash/
│
├── script.sh
├── ticket_status
├── events_tickets
├── events_status
└── README.md

---

## 📄 Files Description

### 1️⃣ ticket_status
Contains incident numbers and their status.

Example:
INC0000401356 closed  
INC0000401357 opened  

---

### 2️⃣ events_tickets
Maps incident numbers to event IDs.

Example:
INC0000401356 6192fd9a-9b03-71ec-01b9-0a4e23470001  

---

### 3️⃣ events_status
Contains event IDs and their current state.

Example:
6192fd9a-9b03-71ec-01b9-0a4e23470001 opened  

---

## ⚙️ How It Works

1. The script asks the user to enter an Incident number.
2. It validates if the incident exists in the ticket_status file.
3. It checks the incident state.
4. If the incident is CLOSED:
   - The related event is retrieved.
   - If the event is OPENED → it will be updated to CLOSED.
5. If the incident is OPEN:
   - No changes are applied.

---

## 🚀 How to Run

Make the script executable:

chmod +x script.sh

Run the script:

./script.sh

Enter an incident number like:

INC0000401356

---

## 🛠 Technologies Used

- Bash
- AWK
- SED
- Linux Shell Scripting
