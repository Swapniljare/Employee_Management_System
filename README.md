# Employee Management System

The **Employee Management System (EMS)** is a Java-based web application that helps manage employee records. It allows performing basic CRUD (Create, Read, Update, Delete) operations with a simple and user-friendly interface.

---

## 🚀 Features Implemented

* Add new employees with details (Name, Email, Position, Salary).
* View a list of all employees.
* Update existing employee details.
* Delete employee records.
* Data stored in **MySQL database**.
* Follows **DAO (Data Access Object) pattern** for database operations.
* JSP pages styled with CSS for a clean UI.

---

## 🛠️ Tech Stack

* **Frontend:** JSP, HTML, CSS
* **Backend:** Java Servlets
* **Database:** MySQL
* **Build Tool:** Apache Maven
* **Server:** Apache Tomcat

---

## ⚙️ Setup Instructions

1. Clone the repository:

   bash
   git clone https://github.com/your-username/Employee_Management_System.git
 
2. Import the project into **Eclipse/IntelliJ** as a Maven project.
3. Create MySQL database:

   sql
   CREATE DATABASE employee_db;
  

   sql
   CREATE TABLE employees (
       id INT PRIMARY KEY AUTO_INCREMENT,
       name VARCHAR(100),
       email VARCHAR(100),
       position VARCHAR(100),
       salary DECIMAL(10,2),
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   
4. Update your MySQL username/password in `DBUtil.java`.
5. Deploy the project on **Apache Tomcat**.
6. Open in browser:

  
   http://localhost:8080/Employee_Management_System/
   

