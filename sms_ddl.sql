
-- -----------------------------------------------------
-- Table `my_training_db`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_training_db`.`address` (
  `id` INT NOT NULL,
  `address_line` VARCHAR(255) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_training_db`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_training_db`.`student` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_student_address_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `my_training_db`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_training_db`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_training_db`.`department` (
  `id` INT NOT NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_training_db`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_training_db`.`course` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `credit` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`, `department_id`),
  INDEX `fk_course_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `my_training_db`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_training_db`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_training_db`.`instructor` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `salary` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_training_db`.`course_has_instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_training_db`.`course_has_instructor` (
  `course_id` INT NOT NULL,
  `instructor_id` INT NOT NULL,
  `year` VARCHAR(45) NULL,
  PRIMARY KEY (`course_id`, `instructor_id`),
  INDEX `fk_course_has_instructor_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `fk_course_has_instructor_course1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_has_instructor_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `my_training_db`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_has_instructor_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `my_training_db`.`instructor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_training_db`.`student_has_course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_training_db`.`student_has_course` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `date_of_enrollment` DATE NULL,
  PRIMARY KEY (`student_id`, `course_id`),
  INDEX `fk_student_has_course_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_student_has_course_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_course_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `my_training_db`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `my_training_db`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

