CREATE database task_db;

USE task_db;

CREATE TABLE m_user(
    user_id VARCHAR(24) NOT NULL ,
    password VARCHAR(32) NOT NULL,
    user_name VARCHAR(20) NOT NULL,
    update_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);

INSERT INTO m_user
            (user_id, password, user_name)
     VALUES ('hoge', 'piyo', 'hogehoge');

CREATE TABLE m_category(
    category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(20) NOT NULL,
    update_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (category_id),
    UNIQUE (category_name)
);

CREATE TABLE m_status(
    status_code CHAR(2) NOT NULL ,
    status_name VARCHAR(20) NOT NULL,
    update_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (status_code),
    UNIQUE (status_name)
);


CREATE TABLE t_task(
    task_id INT NOT NULL AUTO_INCREMENT,
    task_name VARCHAR(50) NOT NULL,
    category_id INT NOT NULL,
    limit_date DATE,
    user_id VARCHAR(24) NOT NULL,
    status_code CHAR(2) NOT NULL ,
    memo VARCHAR(100),
    create_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (task_id),
    FOREIGN KEY (category_id) REFERENCES m_category(category_id),
    FOREIGN KEY (user_id) REFERENCES m_user(user_id),
    FOREIGN KEY (status_code) REFERENCES m_status(status_code)
);

INSERT INTO m_category(category_name) VALUE('新商品 A：開発プロジェクト');
INSERT INTO m_category(category_name) VALUE('新商品 B：改良プロジェクト');

INSERT INTO m_status(status_code,status_name) VALUE('00','未着手');
INSERT INTO m_status(status_code,status_name) VALUE('50','着手');
INSERT INTO m_status(status_code,status_name) VALUE('99','完了');
