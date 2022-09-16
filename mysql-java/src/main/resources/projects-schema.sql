DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
project_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    project_name VARCHAR(128) NOT NULL,
    estimated_hours DECIMAL(7,2),
    actual_hours DECIMAL(7,2),
    difficulty INTEGER,
    notes TEXT
    );
	
CREATE TABLE category (
	category_id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    category_name VARCHAR(128) NOT NULL
    );
    
CREATE TABLE step (
	step_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    project_id INTEGER NOT NULL,
    step_text TEXT NOT NULL,
    step_order INTEGER NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
    );
    
CREATE TABLE material (
	material_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    project_id INTEGER NOT NULL,
    material_name VARCHAR(128) NOT NULL,
    num_required INTEGER,
    cost DECIMAL(7,2),
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
    );

CREATE TABLE project_category (
	project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
    UNIQUE KEY (project_id, category_id)
    );

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('hang screen door', 4, 5, 3, 'use shims');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'door hangers', 2, 4.99);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'screws', 15, 3.99);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'line up screen door with storm door', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'screw in screws into door hangers', 2);
INSERT INTO category (category_id, category_name) VALUES (1, 'doors and windows');
INSERT INTO category (category_id, category_name) VALUES (2, 'repairs');
INSERT INTO category (category_id, category_name) VALUES (3, 'demolishes');
INSERT INTO project_category (project_id, category_id) VALUES (1, 1);
INSERT INTO project_category (project_id, category_id) VALUES (1, 2);