-- Add additional columns to support cross-filtering
-- These columns will help with cross-filtering functionality

-- Add region, product, stage columns to chart_data table
ALTER TABLE chart_data ADD region VARCHAR(50);
ALTER TABLE chart_data ADD product VARCHAR(50);
ALTER TABLE chart_data ADD stage VARCHAR(50);
ALTER TABLE chart_data ADD vehicle_type VARCHAR(50);
ALTER TABLE chart_data ADD vehicle_id VARCHAR(50);

-- Add region, product columns to kpi_metrics table
ALTER TABLE kpi_metrics ADD region VARCHAR(50);
ALTER TABLE kpi_metrics ADD product VARCHAR(50);
ALTER TABLE kpi_metrics ADD vehicle_type VARCHAR(50);
ALTER TABLE kpi_metrics ADD vehicle_id VARCHAR(50);

-- Add region, product columns to sales_representatives table
ALTER TABLE sales_representatives ADD region VARCHAR(50);
ALTER TABLE sales_representatives ADD product VARCHAR(50);

-- Add region column to fleet_vehicles table
ALTER TABLE fleet_vehicles ADD region VARCHAR(50);

-- Add region, vehicle_type columns to service_tickets table
ALTER TABLE service_tickets ADD region VARCHAR(50);
ALTER TABLE service_tickets ADD vehicle_type VARCHAR(50);

-- Update existing data with sample values for cross-filtering
-- Fleet data
UPDATE chart_data SET region = CASE 
  WHEN id % 3 = 0 THEN 'North'
  WHEN id % 3 = 1 THEN 'South'
  ELSE 'East'
END WHERE dashboard_type = 'fleet';

UPDATE chart_data SET vehicle_id = CONCAT('VH', (1000 + (id % 20))) WHERE dashboard_type = 'fleet';

UPDATE kpi_metrics SET region = CASE 
  WHEN id % 3 = 0 THEN 'North'
  WHEN id % 3 = 1 THEN 'South'
  ELSE 'East'
END WHERE dashboard_type = 'fleet';

UPDATE fleet_vehicles SET region = CASE 
  WHEN id % 3 = 0 THEN 'North'
  WHEN id % 3 = 1 THEN 'South'
  ELSE 'East'
END;

-- Sales data
UPDATE chart_data SET region = CASE 
  WHEN id % 4 = 0 THEN 'North'
  WHEN id % 4 = 1 THEN 'South'
  WHEN id % 4 = 2 THEN 'East'
  ELSE 'West'
END WHERE dashboard_type = 'sales';

UPDATE chart_data SET product = CASE 
  WHEN id % 3 = 0 THEN 'Trucks'
  WHEN id % 3 = 1 THEN 'Buses'
  ELSE 'Vans'
END WHERE dashboard_type = 'sales';

UPDATE chart_data SET stage = CASE 
  WHEN id % 4 = 0 THEN 'Lead'
  WHEN id % 4 = 1 THEN 'Qualified'
  WHEN id % 4 = 2 THEN 'Proposal'
  ELSE 'Closed'
END WHERE dashboard_type = 'sales';

UPDATE kpi_metrics SET region = CASE 
  WHEN id % 4 = 0 THEN 'North'
  WHEN id % 4 = 1 THEN 'South'
  WHEN id % 4 = 2 THEN 'East'
  ELSE 'West'
END WHERE dashboard_type = 'sales';

UPDATE kpi_metrics SET product = CASE 
  WHEN id % 3 = 0 THEN 'Trucks'
  WHEN id % 3 = 1 THEN 'Buses'
  ELSE 'Vans'
END WHERE dashboard_type = 'sales';

UPDATE sales_representatives SET region = CASE 
  WHEN id % 4 = 0 THEN 'North'
  WHEN id % 4 = 1 THEN 'South'
  WHEN id % 4 = 2 THEN 'East'
  ELSE 'West'
END;

UPDATE sales_representatives SET product = CASE 
  WHEN id % 3 = 0 THEN 'Trucks'
  WHEN id % 3 = 1 THEN 'Buses'
  ELSE 'Vans'
END;

-- After-sales data
UPDATE chart_data SET region = CASE 
  WHEN id % 3 = 0 THEN 'North'
  WHEN id % 3 = 1 THEN 'South'
  ELSE 'East'
END WHERE dashboard_type = 'afterSales';

UPDATE chart_data SET vehicle_type = CASE 
  WHEN id % 3 = 0 THEN 'Truck'
  WHEN id % 3 = 1 THEN 'Bus'
  ELSE 'Van'
END WHERE dashboard_type = 'afterSales';

UPDATE kpi_metrics SET region = CASE 
  WHEN id % 3 = 0 THEN 'North'
  WHEN id % 3 = 1 THEN 'South'
  ELSE 'East'
END WHERE dashboard_type = 'afterSales';

UPDATE kpi_metrics SET vehicle_type = CASE 
  WHEN id % 3 = 0 THEN 'Truck'
  WHEN id % 3 = 1 THEN 'Bus'
  ELSE 'Van'
END WHERE dashboard_type = 'afterSales';

UPDATE service_tickets SET region = CASE 
  WHEN id % 3 = 0 THEN 'North'
  WHEN id % 3 = 1 THEN 'South'
  ELSE 'East'
END;

UPDATE service_tickets SET vehicle_type = CASE 
  WHEN id % 3 = 0 THEN 'Truck'
  WHEN id % 3 = 1 THEN 'Bus'
  ELSE 'Van'
END;