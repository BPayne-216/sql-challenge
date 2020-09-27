-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Employees] (
    [emp_no] Int  NOT NULL ,
    [emp_title] varchar(5)  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar  NOT NULL ,
    [last_name] varchar  NOT NULL ,
    [sex] varchar(1)  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Departments] (
    [dept_no] Int  NOT NULL ,
    [dept_name] varchar(30)  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Dept_employee] (
    [emp_no] Int  NOT NULL ,
    [dept_no] Int  NOT NULL 
)

CREATE TABLE [Titles] (
    [title_id] varchar(5)  NOT NULL ,
    [title] varchar(30)  NOT NULL 
)

CREATE TABLE [Salaries] (
    [emp_no] Int  NOT NULL ,
    [salary] Int  NOT NULL 
)

CREATE TABLE [Dept_manager] (
    [dept_no] Int  NOT NULL ,
    [emp_no] Int  NOT NULL 
)

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Dept_manager] ([dept_no])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_no]

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_emp_title] FOREIGN KEY([emp_title])
REFERENCES [Titles] ([title_id])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_title]

ALTER TABLE [Dept_employee] WITH CHECK ADD CONSTRAINT [FK_Dept_employee_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dept_employee] CHECK CONSTRAINT [FK_Dept_employee_emp_no]

ALTER TABLE [Dept_employee] WITH CHECK ADD CONSTRAINT [FK_Dept_employee_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dept_employee] CHECK CONSTRAINT [FK_Dept_employee_dept_no]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

COMMIT TRANSACTION QUICKDBD