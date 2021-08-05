use curso;
SELECT @@lc_time_names;
SET lc_time_names = 'pt_BR';

DROP TABLE IF EXISTS dim_tempo;
CREATE TABLE dim_tempo (
        id                      INTEGER PRIMARY KEY,  -- year*10000+month*100+day
        db_data                 DATE NOT NULL,
        ano                    INTEGER NOT NULL,
        mes                   INTEGER NOT NULL, -- 1 to 12
        dia                     INTEGER NOT NULL, -- 1 to 31
        trimestre                 INTEGER NOT NULL, -- 1 to 4
        semana                    INTEGER NOT NULL, -- 1 to 52/53
        nm_dia                VARCHAR(9) NOT NULL, -- 'Monday', 'Tuesday'...
        nm_mes              VARCHAR(9) NOT NULL, -- 'January', 'February'...
        feriado_flag            CHAR(1) DEFAULT 'f',
        fim_de_semana_flag            CHAR(1) DEFAULT 'f',
        UNIQUE td_ymd_idx (ano, mes, dia),
        UNIQUE td_dbdate_idx (db_data)

) Engine=InnoDB;


DROP PROCEDURE IF EXISTS pr_preenche_dt;
DELIMITER //
CREATE PROCEDURE pr_preenche_dt(IN startdate DATE,IN stopdate DATE)
BEGIN
    DECLARE currentdate DATE;
    SET currentdate = startdate;
    WHILE currentdate < stopdate DO
        INSERT INTO dim_tempo VALUES (
                        YEAR(currentdate)*10000+MONTH(currentdate)*100 + DAY(currentdate),
                        currentdate,
                        YEAR(currentdate),
                        MONTH(currentdate),
                        DAY(currentdate),
                        QUARTER(currentdate),
                        WEEKOFYEAR(currentdate),
                        DATE_FORMAT(currentdate,'%W'),
                        DATE_FORMAT(currentdate,'%M'),
                        'f',
                        CASE DAYOFWEEK(currentdate) WHEN 1 THEN 't' WHEN 7 then 't' ELSE 'f' END
                        );
        SET currentdate = ADDDATE(currentdate,INTERVAL 1 DAY);
    END WHILE;
END
//
DELIMITER ;


CALL pr_preenche_dt('2019-01-01','2022-12-31');
OPTIMIZE TABLE dim_tempo;