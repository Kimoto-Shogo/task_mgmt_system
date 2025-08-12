USE task_db;

CREATE TABLE t_comment (
    comment_id INT AUTO_INCREMENT NOT NULL,
    task_id INT NOT NULL,
    user_id VARCHAR(24) NOT NULL,
    comment VARCHAR(100) NOT NULL,
    update_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (task_id) REFERENCES t_task(task_id),
    FOREIGN KEY (user_id) REFERENCES m_user(user_id)  
);
