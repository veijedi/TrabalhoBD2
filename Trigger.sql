DELIMITER $$
CREATE TRIGGER tri_vendas_ai
AFTER INSERT ON comivenda  
FOR EACH ROW
BEGIN
	DECLARE vtotal_itens float(10,2);
    DECLARE vtotal_item float(10,2);
    DECLARE total_item INT;

        SET vtotal_item= (SELECT n_valoivenda FROM comivenda WHERE n_numevenda= new.n_numevenda);
        SET total_item= (SELECT n_qtdeivenda FROM comivenda WHERE n_numevenda= new.n_numevenda);
		SET vtotal_itens= total_item*vtotal_item;
    
        UPDATE comvenda 
        SET n_totavenda= vtotal_itens
        WHERE n_numevenda= new.n_numevenda;
	END $$
DELIMITER ;
       
-- DROP trigger tri_vendas_ai;