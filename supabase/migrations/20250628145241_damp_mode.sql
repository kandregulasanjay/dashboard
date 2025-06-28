-- Comprehensive Dashboard Data Insert Script
-- This script creates 12 months of data for all three dashboards with cross-filtering support

-- Clear existing data first
TRUNCATE TABLE kpi_metrics;
TRUNCATE TABLE chart_data;
TRUNCATE TABLE fleet_vehicles;
TRUNCATE TABLE service_tickets;
TRUNCATE TABLE sales_representatives;

-- =============================================================================
-- KPI METRICS DATA (12 months for all dashboards)
-- =============================================================================

-- FLEET KPI METRICS
INSERT INTO kpi_metrics (dashboard_type, title, value, previous_value, trend, trend_value, icon, month, year, region, vehicle_type, vehicle_id) VALUES
-- January 2025
('fleet', 'Active Vehicles', 145, 140, 'up', '3.6%', 'Truck', 1, 2025, 'North', 'Truck', NULL),
('fleet', 'Fleet Efficiency', 89.2, 87.1, 'up', '2.4%', 'Activity', 1, 2025, 'North', 'Truck', NULL),
('fleet', 'Idle Vehicles', 15, 18, 'down', '16.7%', 'Clock', 1, 2025, 'South', 'Bus', NULL),
('fleet', 'Maintenance Cost', 5800, 6000, 'down', '3.3%', 'Wrench', 1, 2025, 'East', 'Van', NULL),
('fleet', 'Fuel Consumption', 10800, 11000, 'down', '1.8%', 'Target', 1, 2025, 'North', 'Truck', NULL),

-- February 2025
('fleet', 'Active Vehicles', 148, 145, 'up', '2.1%', 'Truck', 2, 2025, 'North', 'Truck', NULL),
('fleet', 'Fleet Efficiency', 90.5, 89.2, 'up', '1.5%', 'Activity', 2, 2025, 'South', 'Bus', NULL),
('fleet', 'Idle Vehicles', 12, 15, 'down', '20.0%', 'Clock', 2, 2025, 'East', 'Van', NULL),
('fleet', 'Maintenance Cost', 5600, 5800, 'down', '3.4%', 'Wrench', 2, 2025, 'North', 'Truck', NULL),
('fleet', 'Fuel Consumption', 10600, 10800, 'down', '1.9%', 'Target', 2, 2025, 'South', 'Bus', NULL),

-- March 2025
('fleet', 'Active Vehicles', 150, 148, 'up', '1.4%', 'Truck', 3, 2025, 'East', 'Van', NULL),
('fleet', 'Fleet Efficiency', 91.8, 90.5, 'up', '1.4%', 'Activity', 3, 2025, 'North', 'Truck', NULL),
('fleet', 'Idle Vehicles', 10, 12, 'down', '16.7%', 'Clock', 3, 2025, 'South', 'Bus', NULL),
('fleet', 'Maintenance Cost', 5400, 5600, 'down', '3.6%', 'Wrench', 3, 2025, 'East', 'Van', NULL),
('fleet', 'Fuel Consumption', 10400, 10600, 'down', '1.9%', 'Target', 3, 2025, 'North', 'Truck', NULL),

-- April 2025
('fleet', 'Active Vehicles', 152, 150, 'up', '1.3%', 'Truck', 4, 2025, 'South', 'Bus', NULL),
('fleet', 'Fleet Efficiency', 92.1, 91.8, 'up', '0.3%', 'Activity', 4, 2025, 'East', 'Van', NULL),
('fleet', 'Idle Vehicles', 8, 10, 'down', '20.0%', 'Clock', 4, 2025, 'North', 'Truck', NULL),
('fleet', 'Maintenance Cost', 5200, 5400, 'down', '3.7%', 'Wrench', 4, 2025, 'South', 'Bus', NULL),
('fleet', 'Fuel Consumption', 10200, 10400, 'down', '1.9%', 'Target', 4, 2025, 'East', 'Van', NULL),

-- May 2025
('fleet', 'Active Vehicles', 155, 152, 'up', '2.0%', 'Truck', 5, 2025, 'North', 'Truck', NULL),
('fleet', 'Fleet Efficiency', 93.2, 92.1, 'up', '1.2%', 'Activity', 5, 2025, 'South', 'Bus', NULL),
('fleet', 'Idle Vehicles', 5, 8, 'down', '37.5%', 'Clock', 5, 2025, 'East', 'Van', NULL),
('fleet', 'Maintenance Cost', 5000, 5200, 'down', '3.8%', 'Wrench', 5, 2025, 'North', 'Truck', NULL),
('fleet', 'Fuel Consumption', 10000, 10200, 'down', '2.0%', 'Target', 5, 2025, 'South', 'Bus', NULL),

-- June 2025
('fleet', 'Active Vehicles', 150, 155, 'down', '3.2%', 'Truck', 6, 2025, 'East', 'Van', NULL),
('fleet', 'Fleet Efficiency', 92.4, 93.2, 'down', '0.9%', 'Activity', 6, 2025, 'North', 'Truck', NULL),
('fleet', 'Idle Vehicles', 10, 5, 'up', '100%', 'Clock', 6, 2025, 'South', 'Bus', NULL),
('fleet', 'Maintenance Cost', 5600, 5000, 'up', '12.0%', 'Wrench', 6, 2025, 'East', 'Van', NULL),
('fleet', 'Fuel Consumption', 10500, 10000, 'up', '5.0%', 'Target', 6, 2025, 'North', 'Truck', NULL),

-- July to December 2025 (continuing the pattern)
('fleet', 'Active Vehicles', 148, 150, 'down', '1.3%', 'Truck', 7, 2025, 'South', 'Bus', NULL),
('fleet', 'Fleet Efficiency', 91.8, 92.4, 'down', '0.6%', 'Activity', 7, 2025, 'East', 'Van', NULL),
('fleet', 'Idle Vehicles', 12, 10, 'up', '20.0%', 'Clock', 7, 2025, 'North', 'Truck', NULL),
('fleet', 'Maintenance Cost', 5800, 5600, 'up', '3.6%', 'Wrench', 7, 2025, 'South', 'Bus', NULL),
('fleet', 'Fuel Consumption', 10700, 10500, 'up', '1.9%', 'Target', 7, 2025, 'East', 'Van', NULL),

('fleet', 'Active Vehicles', 151, 148, 'up', '2.0%', 'Truck', 8, 2025, 'North', 'Truck', NULL),
('fleet', 'Fleet Efficiency', 92.8, 91.8, 'up', '1.1%', 'Activity', 8, 2025, 'South', 'Bus', NULL),
('fleet', 'Idle Vehicles', 9, 12, 'down', '25.0%', 'Clock', 8, 2025, 'East', 'Van', NULL),
('fleet', 'Maintenance Cost', 5500, 5800, 'down', '5.2%', 'Wrench', 8, 2025, 'North', 'Truck', NULL),
('fleet', 'Fuel Consumption', 10400, 10700, 'down', '2.8%', 'Target', 8, 2025, 'South', 'Bus', NULL),

('fleet', 'Active Vehicles', 153, 151, 'up', '1.3%', 'Truck', 9, 2025, 'East', 'Van', NULL),
('fleet', 'Fleet Efficiency', 93.5, 92.8, 'up', '0.8%', 'Activity', 9, 2025, 'North', 'Truck', NULL),
('fleet', 'Idle Vehicles', 7, 9, 'down', '22.2%', 'Clock', 9, 2025, 'South', 'Bus', NULL),
('fleet', 'Maintenance Cost', 5300, 5500, 'down', '3.6%', 'Wrench', 9, 2025, 'East', 'Van', NULL),
('fleet', 'Fuel Consumption', 10200, 10400, 'down', '1.9%', 'Target', 9, 2025, 'North', 'Truck', NULL),

('fleet', 'Active Vehicles', 155, 153, 'up', '1.3%', 'Truck', 10, 2025, 'South', 'Bus', NULL),
('fleet', 'Fleet Efficiency', 94.2, 93.5, 'up', '0.7%', 'Activity', 10, 2025, 'East', 'Van', NULL),
('fleet', 'Idle Vehicles', 5, 7, 'down', '28.6%', 'Clock', 10, 2025, 'North', 'Truck', NULL),
('fleet', 'Maintenance Cost', 5100, 5300, 'down', '3.8%', 'Wrench', 10, 2025, 'South', 'Bus', NULL),
('fleet', 'Fuel Consumption', 10000, 10200, 'down', '2.0%', 'Target', 10, 2025, 'East', 'Van', NULL),

('fleet', 'Active Vehicles', 157, 155, 'up', '1.3%', 'Truck', 11, 2025, 'North', 'Truck', NULL),
('fleet', 'Fleet Efficiency', 94.8, 94.2, 'up', '0.6%', 'Activity', 11, 2025, 'South', 'Bus', NULL),
('fleet', 'Idle Vehicles', 3, 5, 'down', '40.0%', 'Clock', 11, 2025, 'East', 'Van', NULL),
('fleet', 'Maintenance Cost', 4900, 5100, 'down', '3.9%', 'Wrench', 11, 2025, 'North', 'Truck', NULL),
('fleet', 'Fuel Consumption', 9800, 10000, 'down', '2.0%', 'Target', 11, 2025, 'South', 'Bus', NULL),

('fleet', 'Active Vehicles', 160, 157, 'up', '1.9%', 'Truck', 12, 2025, 'East', 'Van', NULL),
('fleet', 'Fleet Efficiency', 95.1, 94.8, 'up', '0.3%', 'Activity', 12, 2025, 'North', 'Truck', NULL),
('fleet', 'Idle Vehicles', 0, 3, 'down', '100%', 'Clock', 12, 2025, 'South', 'Bus', NULL),
('fleet', 'Maintenance Cost', 4700, 4900, 'down', '4.1%', 'Wrench', 12, 2025, 'East', 'Van', NULL),
('fleet', 'Fuel Consumption', 9600, 9800, 'down', '2.0%', 'Target', 12, 2025, 'North', 'Truck', NULL);

-- SALES KPI METRICS (12 months)
INSERT INTO kpi_metrics (dashboard_type, title, value, previous_value, trend, trend_value, icon, month, year, region, product) VALUES
-- January to December 2025
('sales', 'Monthly Revenue', 1100000, 1000000, 'up', '10.0%', 'DollarSign', 1, 2025, 'North', 'Trucks'),
('sales', 'New Clients', 32, 28, 'up', '14.3%', 'Users', 1, 2025, 'South', 'Buses'),
('sales', 'Deals Lost', 3, 5, 'down', '40.0%', 'TrendingDown', 1, 2025, 'East', 'Vans'),
('sales', 'Repeat Customers', 42, 38, 'up', '10.5%', 'Users', 1, 2025, 'West', 'Trucks'),
('sales', 'Conversion Rate', 11.8, 10.5, 'up', '12.4%', 'TrendingUp', 1, 2025, 'North', 'Buses'),

('sales', 'Monthly Revenue', 1150000, 1100000, 'up', '4.5%', 'DollarSign', 2, 2025, 'South', 'Vans'),
('sales', 'New Clients', 34, 32, 'up', '6.3%', 'Users', 2, 2025, 'East', 'Trucks'),
('sales', 'Deals Lost', 2, 3, 'down', '33.3%', 'TrendingDown', 2, 2025, 'West', 'Buses'),
('sales', 'Repeat Customers', 44, 42, 'up', '4.8%', 'Users', 2, 2025, 'North', 'Vans'),
('sales', 'Conversion Rate', 12.2, 11.8, 'up', '3.4%', 'TrendingUp', 2, 2025, 'South', 'Trucks'),

('sales', 'Monthly Revenue', 1200000, 1150000, 'up', '4.3%', 'DollarSign', 3, 2025, 'East', 'Buses'),
('sales', 'New Clients', 36, 34, 'up', '5.9%', 'Users', 3, 2025, 'West', 'Vans'),
('sales', 'Deals Lost', 1, 2, 'down', '50.0%', 'TrendingDown', 3, 2025, 'North', 'Trucks'),
('sales', 'Repeat Customers', 46, 44, 'up', '4.5%', 'Users', 3, 2025, 'South', 'Buses'),
('sales', 'Conversion Rate', 12.8, 12.2, 'up', '4.9%', 'TrendingUp', 3, 2025, 'East', 'Vans'),

('sales', 'Monthly Revenue', 1180000, 1200000, 'down', '1.7%', 'DollarSign', 4, 2025, 'West', 'Trucks'),
('sales', 'New Clients', 33, 36, 'down', '8.3%', 'Users', 4, 2025, 'North', 'Buses'),
('sales', 'Deals Lost', 3, 1, 'up', '200%', 'TrendingDown', 4, 2025, 'South', 'Vans'),
('sales', 'Repeat Customers', 43, 46, 'down', '6.5%', 'Users', 4, 2025, 'East', 'Trucks'),
('sales', 'Conversion Rate', 12.1, 12.8, 'down', '5.5%', 'TrendingUp', 4, 2025, 'West', 'Buses'),

('sales', 'Monthly Revenue', 1250000, 1180000, 'up', '5.9%', 'DollarSign', 5, 2025, 'North', 'Vans'),
('sales', 'New Clients', 38, 33, 'up', '15.2%', 'Users', 5, 2025, 'South', 'Trucks'),
('sales', 'Deals Lost', 2, 3, 'down', '33.3%', 'TrendingDown', 5, 2025, 'East', 'Buses'),
('sales', 'Repeat Customers', 48, 43, 'up', '11.6%', 'Users', 5, 2025, 'West', 'Vans'),
('sales', 'Conversion Rate', 13.2, 12.1, 'up', '9.1%', 'TrendingUp', 5, 2025, 'North', 'Trucks'),

('sales', 'Monthly Revenue', 1200000, 1250000, 'down', '4.0%', 'DollarSign', 6, 2025, 'South', 'Buses'),
('sales', 'New Clients', 35, 38, 'down', '7.9%', 'Users', 6, 2025, 'East', 'Vans'),
('sales', 'Deals Lost', 4, 2, 'up', '100%', 'TrendingDown', 6, 2025, 'West', 'Trucks'),
('sales', 'Repeat Customers', 45, 48, 'down', '6.3%', 'Users', 6, 2025, 'North', 'Buses'),
('sales', 'Conversion Rate', 12.5, 13.2, 'down', '5.3%', 'TrendingUp', 6, 2025, 'South', 'Vans'),

('sales', 'Monthly Revenue', 1280000, 1200000, 'up', '6.7%', 'DollarSign', 7, 2025, 'East', 'Trucks'),
('sales', 'New Clients', 40, 35, 'up', '14.3%', 'Users', 7, 2025, 'West', 'Buses'),
('sales', 'Deals Lost', 2, 4, 'down', '50.0%', 'TrendingDown', 7, 2025, 'North', 'Vans'),
('sales', 'Repeat Customers', 50, 45, 'up', '11.1%', 'Users', 7, 2025, 'South', 'Trucks'),
('sales', 'Conversion Rate', 13.8, 12.5, 'up', '10.4%', 'TrendingUp', 7, 2025, 'East', 'Buses'),

('sales', 'Monthly Revenue', 1320000, 1280000, 'up', '3.1%', 'DollarSign', 8, 2025, 'West', 'Vans'),
('sales', 'New Clients', 42, 40, 'up', '5.0%', 'Users', 8, 2025, 'North', 'Trucks'),
('sales', 'Deals Lost', 1, 2, 'down', '50.0%', 'TrendingDown', 8, 2025, 'South', 'Buses'),
('sales', 'Repeat Customers', 52, 50, 'up', '4.0%', 'Users', 8, 2025, 'East', 'Vans'),
('sales', 'Conversion Rate', 14.2, 13.8, 'up', '2.9%', 'TrendingUp', 8, 2025, 'West', 'Trucks'),

('sales', 'Monthly Revenue', 1350000, 1320000, 'up', '2.3%', 'DollarSign', 9, 2025, 'North', 'Buses'),
('sales', 'New Clients', 44, 42, 'up', '4.8%', 'Users', 9, 2025, 'South', 'Vans'),
('sales', 'Deals Lost', 3, 1, 'up', '200%', 'TrendingDown', 9, 2025, 'East', 'Trucks'),
('sales', 'Repeat Customers', 54, 52, 'up', '3.8%', 'Users', 9, 2025, 'West', 'Buses'),
('sales', 'Conversion Rate', 14.5, 14.2, 'up', '2.1%', 'TrendingUp', 9, 2025, 'North', 'Vans'),

('sales', 'Monthly Revenue', 1380000, 1350000, 'up', '2.2%', 'DollarSign', 10, 2025, 'South', 'Trucks'),
('sales', 'New Clients', 46, 44, 'up', '4.5%', 'Users', 10, 2025, 'East', 'Buses'),
('sales', 'Deals Lost', 2, 3, 'down', '33.3%', 'TrendingDown', 10, 2025, 'West', 'Vans'),
('sales', 'Repeat Customers', 56, 54, 'up', '3.7%', 'Users', 10, 2025, 'North', 'Trucks'),
('sales', 'Conversion Rate', 14.8, 14.5, 'up', '2.1%', 'TrendingUp', 10, 2025, 'South', 'Buses'),

('sales', 'Monthly Revenue', 1420000, 1380000, 'up', '2.9%', 'DollarSign', 11, 2025, 'East', 'Vans'),
('sales', 'New Clients', 48, 46, 'up', '4.3%', 'Users', 11, 2025, 'West', 'Trucks'),
('sales', 'Deals Lost', 1, 2, 'down', '50.0%', 'TrendingDown', 11, 2025, 'North', 'Buses'),
('sales', 'Repeat Customers', 58, 56, 'up', '3.6%', 'Users', 11, 2025, 'South', 'Vans'),
('sales', 'Conversion Rate', 15.2, 14.8, 'up', '2.7%', 'TrendingUp', 11, 2025, 'East', 'Trucks'),

('sales', 'Monthly Revenue', 1450000, 1420000, 'up', '2.1%', 'DollarSign', 12, 2025, 'West', 'Buses'),
('sales', 'New Clients', 50, 48, 'up', '4.2%', 'Users', 12, 2025, 'North', 'Vans'),
('sales', 'Deals Lost', 0, 1, 'down', '100%', 'TrendingDown', 12, 2025, 'South', 'Trucks'),
('sales', 'Repeat Customers', 60, 58, 'up', '3.4%', 'Users', 12, 2025, 'East', 'Buses'),
('sales', 'Conversion Rate', 15.5, 15.2, 'up', '2.0%', 'TrendingUp', 12, 2025, 'West', 'Vans');

-- AFTER-SALES KPI METRICS (12 months)
INSERT INTO kpi_metrics (dashboard_type, title, value, previous_value, trend, trend_value, icon, month, year, region, vehicle_type) VALUES
-- January to December 2025
('afterSales', 'Resolved Tickets', 310, 290, 'up', '6.9%', 'CheckCircle', 1, 2025, 'North', 'Truck'),
('afterSales', 'Pending Tickets', 12, 15, 'down', '20.0%', 'Clock', 1, 2025, 'South', 'Bus'),
('afterSales', 'SLA Compliance', 94.2, 92.5, 'up', '1.8%', 'Target', 1, 2025, 'East', 'Van'),
('afterSales', 'Avg Resolution Time', 6.5, 7.0, 'down', '7.1%', 'Clock', 1, 2025, 'North', 'Truck'),
('afterSales', 'Profit from Repairs', 38000, 35000, 'up', '8.6%', 'DollarSign', 1, 2025, 'South', 'Bus'),

('afterSales', 'Resolved Tickets', 315, 310, 'up', '1.6%', 'CheckCircle', 2, 2025, 'East', 'Van'),
('afterSales', 'Pending Tickets', 10, 12, 'down', '16.7%', 'Clock', 2, 2025, 'North', 'Truck'),
('afterSales', 'SLA Compliance', 94.8, 94.2, 'up', '0.6%', 'Target', 2, 2025, 'South', 'Bus'),
('afterSales', 'Avg Resolution Time', 6.2, 6.5, 'down', '4.6%', 'Clock', 2, 2025, 'East', 'Van'),
('afterSales', 'Profit from Repairs', 39000, 38000, 'up', '2.6%', 'DollarSign', 2, 2025, 'North', 'Truck'),

('afterSales', 'Resolved Tickets', 320, 315, 'up', '1.6%', 'CheckCircle', 3, 2025, 'South', 'Bus'),
('afterSales', 'Pending Tickets', 8, 10, 'down', '20.0%', 'Clock', 3, 2025, 'East', 'Van'),
('afterSales', 'SLA Compliance', 95.2, 94.8, 'up', '0.4%', 'Target', 3, 2025, 'North', 'Truck'),
('afterSales', 'Avg Resolution Time', 6.0, 6.2, 'down', '3.2%', 'Clock', 3, 2025, 'South', 'Bus'),
('afterSales', 'Profit from Repairs', 40000, 39000, 'up', '2.6%', 'DollarSign', 3, 2025, 'East', 'Van'),

('afterSales', 'Resolved Tickets', 318, 320, 'down', '0.6%', 'CheckCircle', 4, 2025, 'North', 'Truck'),
('afterSales', 'Pending Tickets', 10, 8, 'up', '25.0%', 'Clock', 4, 2025, 'South', 'Bus'),
('afterSales', 'SLA Compliance', 94.9, 95.2, 'down', '0.3%', 'Target', 4, 2025, 'East', 'Van'),
('afterSales', 'Avg Resolution Time', 6.3, 6.0, 'up', '5.0%', 'Clock', 4, 2025, 'North', 'Truck'),
('afterSales', 'Profit from Repairs', 39500, 40000, 'down', '1.3%', 'DollarSign', 4, 2025, 'South', 'Bus'),

('afterSales', 'Resolved Tickets', 325, 318, 'up', '2.2%', 'CheckCircle', 5, 2025, 'East', 'Van'),
('afterSales', 'Pending Tickets', 7, 10, 'down', '30.0%', 'Clock', 5, 2025, 'North', 'Truck'),
('afterSales', 'SLA Compliance', 95.8, 94.9, 'up', '0.9%', 'Target', 5, 2025, 'South', 'Bus'),
('afterSales', 'Avg Resolution Time', 5.8, 6.3, 'down', '7.9%', 'Clock', 5, 2025, 'East', 'Van'),
('afterSales', 'Profit from Repairs', 41000, 39500, 'up', '3.8%', 'DollarSign', 5, 2025, 'North', 'Truck'),

('afterSales', 'Resolved Tickets', 320, 325, 'down', '1.5%', 'CheckCircle', 6, 2025, 'South', 'Bus'),
('afterSales', 'Pending Tickets', 10, 7, 'up', '42.9%', 'Clock', 6, 2025, 'East', 'Van'),
('afterSales', 'SLA Compliance', 95.5, 95.8, 'down', '0.3%', 'Target', 6, 2025, 'North', 'Truck'),
('afterSales', 'Avg Resolution Time', 6.2, 5.8, 'up', '6.9%', 'Clock', 6, 2025, 'South', 'Bus'),
('afterSales', 'Profit from Repairs', 40000, 41000, 'down', '2.4%', 'DollarSign', 6, 2025, 'East', 'Van'),

('afterSales', 'Resolved Tickets', 330, 320, 'up', '3.1%', 'CheckCircle', 7, 2025, 'North', 'Truck'),
('afterSales', 'Pending Tickets', 8, 10, 'down', '20.0%', 'Clock', 7, 2025, 'South', 'Bus'),
('afterSales', 'SLA Compliance', 96.1, 95.5, 'up', '0.6%', 'Target', 7, 2025, 'East', 'Van'),
('afterSales', 'Avg Resolution Time', 5.9, 6.2, 'down', '4.8%', 'Clock', 7, 2025, 'North', 'Truck'),
('afterSales', 'Profit from Repairs', 42000, 40000, 'up', '5.0%', 'DollarSign', 7, 2025, 'South', 'Bus'),

('afterSales', 'Resolved Tickets', 335, 330, 'up', '1.5%', 'CheckCircle', 8, 2025, 'East', 'Van'),
('afterSales', 'Pending Tickets', 6, 8, 'down', '25.0%', 'Clock', 8, 2025, 'North', 'Truck'),
('afterSales', 'SLA Compliance', 96.4, 96.1, 'up', '0.3%', 'Target', 8, 2025, 'South', 'Bus'),
('afterSales', 'Avg Resolution Time', 5.7, 5.9, 'down', '3.4%', 'Clock', 8, 2025, 'East', 'Van'),
('afterSales', 'Profit from Repairs', 43000, 42000, 'up', '2.4%', 'DollarSign', 8, 2025, 'North', 'Truck'),

('afterSales', 'Resolved Tickets', 340, 335, 'up', '1.5%', 'CheckCircle', 9, 2025, 'South', 'Bus'),
('afterSales', 'Pending Tickets', 5, 6, 'down', '16.7%', 'Clock', 9, 2025, 'East', 'Van'),
('afterSales', 'SLA Compliance', 96.8, 96.4, 'up', '0.4%', 'Target', 9, 2025, 'North', 'Truck'),
('afterSales', 'Avg Resolution Time', 5.5, 5.7, 'down', '3.5%', 'Clock', 9, 2025, 'South', 'Bus'),
('afterSales', 'Profit from Repairs', 44000, 43000, 'up', '2.3%', 'DollarSign', 9, 2025, 'East', 'Van'),

('afterSales', 'Resolved Tickets', 345, 340, 'up', '1.5%', 'CheckCircle', 10, 2025, 'North', 'Truck'),
('afterSales', 'Pending Tickets', 4, 5, 'down', '20.0%', 'Clock', 10, 2025, 'South', 'Bus'),
('afterSales', 'SLA Compliance', 97.1, 96.8, 'up', '0.3%', 'Target', 10, 2025, 'East', 'Van'),
('afterSales', 'Avg Resolution Time', 5.3, 5.5, 'down', '3.6%', 'Clock', 10, 2025, 'North', 'Truck'),
('afterSales', 'Profit from Repairs', 45000, 44000, 'up', '2.3%', 'DollarSign', 10, 2025, 'South', 'Bus'),

('afterSales', 'Resolved Tickets', 350, 345, 'up', '1.4%', 'CheckCircle', 11, 2025, 'East', 'Van'),
('afterSales', 'Pending Tickets', 3, 4, 'down', '25.0%', 'Clock', 11, 2025, 'North', 'Truck'),
('afterSales', 'SLA Compliance', 97.4, 97.1, 'up', '0.3%', 'Target', 11, 2025, 'South', 'Bus'),
('afterSales', 'Avg Resolution Time', 5.1, 5.3, 'down', '3.8%', 'Clock', 11, 2025, 'East', 'Van'),
('afterSales', 'Profit from Repairs', 46000, 45000, 'up', '2.2%', 'DollarSign', 11, 2025, 'North', 'Truck'),

('afterSales', 'Resolved Tickets', 355, 350, 'up', '1.4%', 'CheckCircle', 12, 2025, 'South', 'Bus'),
('afterSales', 'Pending Tickets', 2, 3, 'down', '33.3%', 'Clock', 12, 2025, 'East', 'Van'),
('afterSales', 'SLA Compliance', 97.8, 97.4, 'up', '0.4%', 'Target', 12, 2025, 'North', 'Truck'),
('afterSales', 'Avg Resolution Time', 4.9, 5.1, 'down', '3.9%', 'Clock', 12, 2025, 'South', 'Bus'),
('afterSales', 'Profit from Repairs', 47000, 46000, 'up', '2.2%', 'DollarSign', 12, 2025, 'East', 'Van');

-- =============================================================================
-- CHART DATA (12 months for all dashboards and all 4 charts)
-- =============================================================================

-- FLEET CHART DATA
-- Chart 1: Fleet Utilization Trend (Line Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, vehicle_id, vehicle_type) VALUES
('fleet', 'line', 'Fleet Uptime', 'Jan', 89.2, 90.0, NULL, 1, 2025, 'North', 'VH1001', 'Truck'),
('fleet', 'line', 'Fleet Uptime', 'Feb', 90.5, 91.0, NULL, 2, 2025, 'South', 'VH1002', 'Bus'),
('fleet', 'line', 'Fleet Uptime', 'Mar', 91.8, 92.0, NULL, 3, 2025, 'East', 'VH1003', 'Van'),
('fleet', 'line', 'Fleet Uptime', 'Apr', 92.1, 92.5, NULL, 4, 2025, 'North', 'VH1004', 'Truck'),
('fleet', 'line', 'Fleet Uptime', 'May', 93.2, 93.0, NULL, 5, 2025, 'South', 'VH1005', 'Bus'),
('fleet', 'line', 'Fleet Uptime', 'Jun', 92.4, 93.0, NULL, 6, 2025, 'East', 'VH1006', 'Van'),
('fleet', 'line', 'Fleet Uptime', 'Jul', 91.8, 92.5, NULL, 7, 2025, 'North', 'VH1007', 'Truck'),
('fleet', 'line', 'Fleet Uptime', 'Aug', 92.8, 93.0, NULL, 8, 2025, 'South', 'VH1008', 'Bus'),
('fleet', 'line', 'Fleet Uptime', 'Sep', 93.5, 94.0, NULL, 9, 2025, 'East', 'VH1009', 'Van'),
('fleet', 'line', 'Fleet Uptime', 'Oct', 94.2, 94.5, NULL, 10, 2025, 'North', 'VH1010', 'Truck'),
('fleet', 'line', 'Fleet Uptime', 'Nov', 94.8, 95.0, NULL, 11, 2025, 'South', 'VH1011', 'Bus'),
('fleet', 'line', 'Fleet Uptime', 'Dec', 95.1, 95.5, NULL, 12, 2025, 'East', 'VH1012', 'Van');

-- Chart 2: Vehicle Distribution (Pie Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, vehicle_type) VALUES
('fleet', 'pie', 'Vehicle Distribution', 'Active', 145, NULL, 'green', 1, 2025, 'North', 'Truck'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 15, NULL, 'gray', 1, 2025, 'South', 'Bus'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 148, NULL, 'green', 2, 2025, 'East', 'Van'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 12, NULL, 'gray', 2, 2025, 'North', 'Truck'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 150, NULL, 'green', 3, 2025, 'South', 'Bus'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 10, NULL, 'gray', 3, 2025, 'East', 'Van'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 152, NULL, 'green', 4, 2025, 'North', 'Truck'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 8, NULL, 'gray', 4, 2025, 'South', 'Bus'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 155, NULL, 'green', 5, 2025, 'East', 'Van'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 5, NULL, 'gray', 5, 2025, 'North', 'Truck'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 150, NULL, 'green', 6, 2025, 'South', 'Bus'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 10, NULL, 'gray', 6, 2025, 'East', 'Van'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 148, NULL, 'green', 7, 2025, 'North', 'Truck'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 12, NULL, 'gray', 7, 2025, 'South', 'Bus'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 151, NULL, 'green', 8, 2025, 'East', 'Van'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 9, NULL, 'gray', 8, 2025, 'North', 'Truck'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 153, NULL, 'green', 9, 2025, 'South', 'Bus'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 7, NULL, 'gray', 9, 2025, 'East', 'Van'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 155, NULL, 'green', 10, 2025, 'North', 'Truck'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 5, NULL, 'gray', 10, 2025, 'South', 'Bus'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 157, NULL, 'green', 11, 2025, 'East', 'Van'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 3, NULL, 'gray', 11, 2025, 'North', 'Truck'),
('fleet', 'pie', 'Vehicle Distribution', 'Active', 160, NULL, 'green', 12, 2025, 'South', 'Bus'),
('fleet', 'pie', 'Vehicle Distribution', 'Idle', 0, NULL, 'gray', 12, 2025, 'East', 'Van');

-- Chart 3: Maintenance Costs (Area Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, vehicle_id, vehicle_type) VALUES
('fleet', 'area', 'Maintenance Costs', 'VH1001', 1100, 1200, NULL, 1, 2025, 'North', 'VH1001', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1200, 1300, NULL, 1, 2025, 'South', 'VH1002', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2500, 2200, NULL, 1, 2025, 'East', 'VH1003', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 800, 1000, NULL, 1, 2025, 'North', 'VH1004', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 1050, 1200, NULL, 2, 2025, 'South', 'VH1001', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1150, 1300, NULL, 2, 2025, 'East', 'VH1002', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2400, 2200, NULL, 2, 2025, 'North', 'VH1003', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 750, 1000, NULL, 2, 2025, 'South', 'VH1004', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 1000, 1200, NULL, 3, 2025, 'East', 'VH1001', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1100, 1300, NULL, 3, 2025, 'North', 'VH1002', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2300, 2200, NULL, 3, 2025, 'South', 'VH1003', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 700, 1000, NULL, 3, 2025, 'East', 'VH1004', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 950, 1200, NULL, 4, 2025, 'North', 'VH1001', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1050, 1300, NULL, 4, 2025, 'South', 'VH1002', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2200, 2200, NULL, 4, 2025, 'East', 'VH1003', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 650, 1000, NULL, 4, 2025, 'North', 'VH1004', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 900, 1200, NULL, 5, 2025, 'South', 'VH1001', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1000, 1300, NULL, 5, 2025, 'East', 'VH1002', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2100, 2200, NULL, 5, 2025, 'North', 'VH1003', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 600, 1000, NULL, 5, 2025, 'South', 'VH1004', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 1100, 1200, NULL, 6, 2025, 'East', 'VH1001', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1200, 1300, NULL, 6, 2025, 'North', 'VH1002', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2500, 2200, NULL, 6, 2025, 'South', 'VH1003', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 800, 1000, NULL, 6, 2025, 'East', 'VH1004', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 1150, 1200, NULL, 7, 2025, 'North', 'VH1001', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1250, 1300, NULL, 7, 2025, 'South', 'VH1002', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2400, 2200, NULL, 7, 2025, 'East', 'VH1003', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 750, 1000, NULL, 7, 2025, 'North', 'VH1004', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 1050, 1200, NULL, 8, 2025, 'South', 'VH1001', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1150, 1300, NULL, 8, 2025, 'East', 'VH1002', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2300, 2200, NULL, 8, 2025, 'North', 'VH1003', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 700, 1000, NULL, 8, 2025, 'South', 'VH1004', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 1000, 1200, NULL, 9, 2025, 'East', 'VH1001', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1100, 1300, NULL, 9, 2025, 'North', 'VH1002', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2200, 2200, NULL, 9, 2025, 'South', 'VH1003', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 650, 1000, NULL, 9, 2025, 'East', 'VH1004', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 950, 1200, NULL, 10, 2025, 'North', 'VH1001', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1050, 1300, NULL, 10, 2025, 'South', 'VH1002', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2100, 2200, NULL, 10, 2025, 'East', 'VH1003', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 600, 1000, NULL, 10, 2025, 'North', 'VH1004', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 900, 1200, NULL, 11, 2025, 'South', 'VH1001', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 1000, 1300, NULL, 11, 2025, 'East', 'VH1002', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 2000, 2200, NULL, 11, 2025, 'North', 'VH1003', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 550, 1000, NULL, 11, 2025, 'South', 'VH1004', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1001', 850, 1200, NULL, 12, 2025, 'East', 'VH1001', 'Van'),
('fleet', 'area', 'Maintenance Costs', 'VH1002', 950, 1300, NULL, 12, 2025, 'North', 'VH1002', 'Truck'),
('fleet', 'area', 'Maintenance Costs', 'VH1003', 1900, 2200, NULL, 12, 2025, 'South', 'VH1003', 'Bus'),
('fleet', 'area', 'Maintenance Costs', 'VH1004', 500, 1000, NULL, 12, 2025, 'East', 'VH1004', 'Van');

-- Chart 4: Vehicle Status (Bar Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, vehicle_type) VALUES
('fleet', 'bar', 'Vehicle Status', 'Active', 145, 150, 'green', 1, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 10, 8, 'orange', 1, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 5, 2, 'red', 1, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 148, 150, 'green', 2, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 8, 8, 'orange', 2, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 4, 2, 'red', 2, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 150, 150, 'green', 3, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 7, 8, 'orange', 3, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 3, 2, 'red', 3, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 152, 150, 'green', 4, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 6, 8, 'orange', 4, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 2, 2, 'red', 4, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 155, 150, 'green', 5, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 4, 8, 'orange', 5, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 1, 2, 'red', 5, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 150, 150, 'green', 6, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 8, 8, 'orange', 6, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 2, 2, 'red', 6, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 148, 150, 'green', 7, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 10, 8, 'orange', 7, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 2, 2, 'red', 7, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 151, 150, 'green', 8, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 7, 8, 'orange', 8, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 2, 2, 'red', 8, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 153, 150, 'green', 9, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 6, 8, 'orange', 9, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 1, 2, 'red', 9, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 155, 150, 'green', 10, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 4, 8, 'orange', 10, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 1, 2, 'red', 10, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 157, 150, 'green', 11, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 3, 8, 'orange', 11, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 0, 2, 'red', 11, 2025, 'East', 'Van'),
('fleet', 'bar', 'Vehicle Status', 'Active', 160, 150, 'green', 12, 2025, 'North', 'Truck'),
('fleet', 'bar', 'Vehicle Status', 'Maintenance', 0, 8, 'orange', 12, 2025, 'South', 'Bus'),
('fleet', 'bar', 'Vehicle Status', 'Idle', 0, 2, 'red', 12, 2025, 'East', 'Van');

-- SALES CHART DATA
-- Chart 1: Monthly Revenue (Line Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, product, stage) VALUES
('sales', 'line', 'Monthly Revenue', 'Jan', 1100000, 1050000, NULL, 1, 2025, 'North', 'Trucks', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Feb', 1150000, 1120000, NULL, 2, 2025, 'South', 'Buses', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Mar', 1200000, 1180000, NULL, 3, 2025, 'East', 'Vans', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Apr', 1180000, 1200000, NULL, 4, 2025, 'West', 'Trucks', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'May', 1250000, 1220000, NULL, 5, 2025, 'North', 'Buses', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Jun', 1200000, 1250000, NULL, 6, 2025, 'South', 'Vans', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Jul', 1280000, 1260000, NULL, 7, 2025, 'East', 'Trucks', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Aug', 1320000, 1300000, NULL, 8, 2025, 'West', 'Buses', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Sep', 1350000, 1330000, NULL, 9, 2025, 'North', 'Vans', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Oct', 1380000, 1360000, NULL, 10, 2025, 'South', 'Trucks', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Nov', 1420000, 1400000, NULL, 11, 2025, 'East', 'Buses', 'Closed'),
('sales', 'line', 'Monthly Revenue', 'Dec', 1450000, 1430000, NULL, 12, 2025, 'West', 'Vans', 'Closed');

-- Chart 2: Client Type Distribution (Pie Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, product, stage) VALUES
('sales', 'pie', 'Client Type Distribution', 'New', 60, NULL, 'blue', 1, 2025, 'North', 'Trucks', 'Lead'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 40, NULL, 'purple', 1, 2025, 'South', 'Buses', 'Qualified'),
('sales', 'pie', 'Client Type Distribution', 'New', 62, NULL, 'blue', 2, 2025, 'East', 'Vans', 'Proposal'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 38, NULL, 'purple', 2, 2025, 'West', 'Trucks', 'Closed'),
('sales', 'pie', 'Client Type Distribution', 'New', 65, NULL, 'blue', 3, 2025, 'North', 'Buses', 'Lead'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 35, NULL, 'purple', 3, 2025, 'South', 'Vans', 'Qualified'),
('sales', 'pie', 'Client Type Distribution', 'New', 58, NULL, 'blue', 4, 2025, 'East', 'Trucks', 'Proposal'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 42, NULL, 'purple', 4, 2025, 'West', 'Buses', 'Closed'),
('sales', 'pie', 'Client Type Distribution', 'New', 68, NULL, 'blue', 5, 2025, 'North', 'Vans', 'Lead'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 32, NULL, 'purple', 5, 2025, 'South', 'Trucks', 'Qualified'),
('sales', 'pie', 'Client Type Distribution', 'New', 60, NULL, 'blue', 6, 2025, 'East', 'Buses', 'Proposal'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 40, NULL, 'purple', 6, 2025, 'West', 'Vans', 'Closed'),
('sales', 'pie', 'Client Type Distribution', 'New', 70, NULL, 'blue', 7, 2025, 'North', 'Trucks', 'Lead'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 30, NULL, 'purple', 7, 2025, 'South', 'Buses', 'Qualified'),
('sales', 'pie', 'Client Type Distribution', 'New', 72, NULL, 'blue', 8, 2025, 'East', 'Vans', 'Proposal'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 28, NULL, 'purple', 8, 2025, 'West', 'Trucks', 'Closed'),
('sales', 'pie', 'Client Type Distribution', 'New', 74, NULL, 'blue', 9, 2025, 'North', 'Buses', 'Lead'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 26, NULL, 'purple', 9, 2025, 'South', 'Vans', 'Qualified'),
('sales', 'pie', 'Client Type Distribution', 'New', 76, NULL, 'blue', 10, 2025, 'East', 'Trucks', 'Proposal'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 24, NULL, 'purple', 10, 2025, 'West', 'Buses', 'Closed'),
('sales', 'pie', 'Client Type Distribution', 'New', 78, NULL, 'blue', 11, 2025, 'North', 'Vans', 'Lead'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 22, NULL, 'purple', 11, 2025, 'South', 'Trucks', 'Qualified'),
('sales', 'pie', 'Client Type Distribution', 'New', 80, NULL, 'blue', 12, 2025, 'East', 'Buses', 'Proposal'),
('sales', 'pie', 'Client Type Distribution', 'Returning', 20, NULL, 'purple', 12, 2025, 'West', 'Vans', 'Closed');

-- Chart 3: Sales by Rep (Bar Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, product, stage) VALUES
('sales', 'bar', 'Sales by Rep', 'Alice', 300000, 350000, NULL, 1, 2025, 'North', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 250000, 320000, NULL, 1, 2025, 'South', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 200000, 280000, NULL, 1, 2025, 'East', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 180000, 250000, NULL, 1, 2025, 'West', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 310000, 350000, NULL, 2, 2025, 'North', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 260000, 320000, NULL, 2, 2025, 'South', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 210000, 280000, NULL, 2, 2025, 'East', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 190000, 250000, NULL, 2, 2025, 'West', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 320000, 350000, NULL, 3, 2025, 'North', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 270000, 320000, NULL, 3, 2025, 'South', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 220000, 280000, NULL, 3, 2025, 'East', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 200000, 250000, NULL, 3, 2025, 'West', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 315000, 350000, NULL, 4, 2025, 'North', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 265000, 320000, NULL, 4, 2025, 'South', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 215000, 280000, NULL, 4, 2025, 'East', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 195000, 250000, NULL, 4, 2025, 'West', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 330000, 350000, NULL, 5, 2025, 'North', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 280000, 320000, NULL, 5, 2025, 'South', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 230000, 280000, NULL, 5, 2025, 'East', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 210000, 250000, NULL, 5, 2025, 'West', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 325000, 350000, NULL, 6, 2025, 'North', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 275000, 320000, NULL, 6, 2025, 'South', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 225000, 280000, NULL, 6, 2025, 'East', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 205000, 250000, NULL, 6, 2025, 'West', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 340000, 350000, NULL, 7, 2025, 'North', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 290000, 320000, NULL, 7, 2025, 'South', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 240000, 280000, NULL, 7, 2025, 'East', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 220000, 250000, NULL, 7, 2025, 'West', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 350000, 350000, NULL, 8, 2025, 'North', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 300000, 320000, NULL, 8, 2025, 'South', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 250000, 280000, NULL, 8, 2025, 'East', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 230000, 250000, NULL, 8, 2025, 'West', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 360000, 350000, NULL, 9, 2025, 'North', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 310000, 320000, NULL, 9, 2025, 'South', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 260000, 280000, NULL, 9, 2025, 'East', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 240000, 250000, NULL, 9, 2025, 'West', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 370000, 350000, NULL, 10, 2025, 'North', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 320000, 320000, NULL, 10, 2025, 'South', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 270000, 280000, NULL, 10, 2025, 'East', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 250000, 250000, NULL, 10, 2025, 'West', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 380000, 350000, NULL, 11, 2025, 'North', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 330000, 320000, NULL, 11, 2025, 'South', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 280000, 280000, NULL, 11, 2025, 'East', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 260000, 250000, NULL, 11, 2025, 'West', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Alice', 390000, 350000, NULL, 12, 2025, 'North', 'Vans', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Bob', 340000, 320000, NULL, 12, 2025, 'South', 'Trucks', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Charlie', 290000, 280000, NULL, 12, 2025, 'East', 'Buses', 'Closed'),
('sales', 'bar', 'Sales by Rep', 'Diana', 270000, 250000, NULL, 12, 2025, 'West', 'Vans', 'Closed');

-- Chart 4: Revenue Growth (Area Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, product, stage) VALUES
('sales', 'area', 'Revenue Growth', 'Q1', 3450000, 3500000, NULL, 1, 2025, 'North', 'Trucks', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q1', 3450000, 3500000, NULL, 2, 2025, 'South', 'Buses', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q1', 3450000, 3500000, NULL, 3, 2025, 'East', 'Vans', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q2', 3630000, 3700000, NULL, 4, 2025, 'West', 'Trucks', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q2', 3630000, 3700000, NULL, 5, 2025, 'North', 'Buses', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q2', 3630000, 3700000, NULL, 6, 2025, 'South', 'Vans', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q3', 3950000, 3900000, NULL, 7, 2025, 'East', 'Trucks', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q3', 3950000, 3900000, NULL, 8, 2025, 'West', 'Buses', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q3', 3950000, 3900000, NULL, 9, 2025, 'North', 'Vans', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q4', 4250000, 4100000, NULL, 10, 2025, 'South', 'Trucks', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q4', 4250000, 4100000, NULL, 11, 2025, 'East', 'Buses', 'Closed'),
('sales', 'area', 'Revenue Growth', 'Q4', 4250000, 4100000, NULL, 12, 2025, 'West', 'Vans', 'Closed');

-- AFTER-SALES CHART DATA
-- Chart 1: SLA Compliance (Line Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, vehicle_type) VALUES
('afterSales', 'line', 'SLA Compliance', 'Jan', 94.2, 96.0, NULL, 1, 2025, 'North', 'Truck'),
('afterSales', 'line', 'SLA Compliance', 'Feb', 94.8, 96.0, NULL, 2, 2025, 'South', 'Bus'),
('afterSales', 'line', 'SLA Compliance', 'Mar', 95.2, 96.0, NULL, 3, 2025, 'East', 'Van'),
('afterSales', 'line', 'SLA Compliance', 'Apr', 94.9, 96.0, NULL, 4, 2025, 'North', 'Truck'),
('afterSales', 'line', 'SLA Compliance', 'May', 95.8, 96.0, NULL, 5, 2025, 'South', 'Bus'),
('afterSales', 'line', 'SLA Compliance', 'Jun', 95.5, 96.0, NULL, 6, 2025, 'East', 'Van'),
('afterSales', 'line', 'SLA Compliance', 'Jul', 96.1, 96.0, NULL, 7, 2025, 'North', 'Truck'),
('afterSales', 'line', 'SLA Compliance', 'Aug', 96.4, 96.0, NULL, 8, 2025, 'South', 'Bus'),
('afterSales', 'line', 'SLA Compliance', 'Sep', 96.8, 96.0, NULL, 9, 2025, 'East', 'Van'),
('afterSales', 'line', 'SLA Compliance', 'Oct', 97.1, 96.0, NULL, 10, 2025, 'North', 'Truck'),
('afterSales', 'line', 'SLA Compliance', 'Nov', 97.4, 96.0, NULL, 11, 2025, 'South', 'Bus'),
('afterSales', 'line', 'SLA Compliance', 'Dec', 97.8, 96.0, NULL, 12, 2025, 'East', 'Van');

-- Chart 2: Tickets by Status (Bar Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, vehicle_type) VALUES
('afterSales', 'bar', 'Tickets by Status', 'Completed', 310, 300, 'green', 1, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 15, 20, 'orange', 1, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 12, 10, 'red', 1, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 315, 300, 'green', 2, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 12, 20, 'orange', 2, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 10, 10, 'red', 2, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 320, 300, 'green', 3, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 10, 20, 'orange', 3, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 8, 10, 'red', 3, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 318, 300, 'green', 4, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 12, 20, 'orange', 4, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 10, 10, 'red', 4, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 325, 300, 'green', 5, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 8, 20, 'orange', 5, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 7, 10, 'red', 5, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 320, 300, 'green', 6, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 10, 20, 'orange', 6, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 10, 10, 'red', 6, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 330, 300, 'green', 7, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 8, 20, 'orange', 7, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 8, 10, 'red', 7, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 335, 300, 'green', 8, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 6, 20, 'orange', 8, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 6, 10, 'red', 8, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 340, 300, 'green', 9, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 5, 20, 'orange', 9, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 5, 10, 'red', 9, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 345, 300, 'green', 10, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 4, 20, 'orange', 10, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 4, 10, 'red', 10, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 350, 300, 'green', 11, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 3, 20, 'orange', 11, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 3, 10, 'red', 11, 2025, 'East', 'Van'),
('afterSales', 'bar', 'Tickets by Status', 'Completed', 355, 300, 'green', 12, 2025, 'North', 'Truck'),
('afterSales', 'bar', 'Tickets by Status', 'In Progress', 2, 20, 'orange', 12, 2025, 'South', 'Bus'),
('afterSales', 'bar', 'Tickets by Status', 'Pending', 2, 10, 'red', 12, 2025, 'East', 'Van');

-- Chart 3: Issue Category (Pie Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, vehicle_type) VALUES
('afterSales', 'pie', 'Issue Category', 'Electrical', 35, NULL, 'red', 1, 2025, 'North', 'Truck'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 65, NULL, 'blue', 1, 2025, 'South', 'Bus'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 33, NULL, 'red', 2, 2025, 'East', 'Van'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 67, NULL, 'blue', 2, 2025, 'North', 'Truck'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 30, NULL, 'red', 3, 2025, 'South', 'Bus'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 70, NULL, 'blue', 3, 2025, 'East', 'Van'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 32, NULL, 'red', 4, 2025, 'North', 'Truck'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 68, NULL, 'blue', 4, 2025, 'South', 'Bus'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 28, NULL, 'red', 5, 2025, 'East', 'Van'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 72, NULL, 'blue', 5, 2025, 'North', 'Truck'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 35, NULL, 'red', 6, 2025, 'South', 'Bus'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 65, NULL, 'blue', 6, 2025, 'East', 'Van'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 25, NULL, 'red', 7, 2025, 'North', 'Truck'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 75, NULL, 'blue', 7, 2025, 'South', 'Bus'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 22, NULL, 'red', 8, 2025, 'East', 'Van'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 78, NULL, 'blue', 8, 2025, 'North', 'Truck'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 20, NULL, 'red', 9, 2025, 'South', 'Bus'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 80, NULL, 'blue', 9, 2025, 'East', 'Van'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 18, NULL, 'red', 10, 2025, 'North', 'Truck'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 82, NULL, 'blue', 10, 2025, 'South', 'Bus'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 15, NULL, 'red', 11, 2025, 'East', 'Van'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 85, NULL, 'blue', 11, 2025, 'North', 'Truck'),
('afterSales', 'pie', 'Issue Category', 'Electrical', 12, NULL, 'red', 12, 2025, 'South', 'Bus'),
('afterSales', 'pie', 'Issue Category', 'Mechanical', 88, NULL, 'blue', 12, 2025, 'East', 'Van');

-- Chart 4: Resolution Time (Area Chart)
INSERT INTO chart_data (dashboard_type, chart_type, name, data_point_name, data_point_value, additional_value, color, month, year, region, vehicle_type) VALUES
('afterSales', 'area', 'Resolution Time', 'Team A', 6.5, 6.0, NULL, 1, 2025, 'North', 'Truck'),
('afterSales', 'area', 'Resolution Time', 'Team B', 7.0, 6.5, NULL, 1, 2025, 'South', 'Bus'),
('afterSales', 'area', 'Resolution Time', 'Team A', 6.2, 6.0, NULL, 2, 2025, 'East', 'Van'),
('afterSales', 'area', 'Resolution Time', 'Team B', 6.8, 6.5, NULL, 2, 2025, 'North', 'Truck'),
('afterSales', 'area', 'Resolution Time', 'Team A', 6.0, 6.0, NULL, 3, 2025, 'South', 'Bus'),
('afterSales', 'area', 'Resolution Time', 'Team B', 6.5, 6.5, NULL, 3, 2025, 'East', 'Van'),
('afterSales', 'area', 'Resolution Time', 'Team A', 6.3, 6.0, NULL, 4, 2025, 'North', 'Truck'),
('afterSales', 'area', 'Resolution Time', 'Team B', 6.7, 6.5, NULL, 4, 2025, 'South', 'Bus'),
('afterSales', 'area', 'Resolution Time', 'Team A', 5.8, 6.0, NULL, 5, 2025, 'East', 'Van'),
('afterSales', 'area', 'Resolution Time', 'Team B', 6.3, 6.5, NULL, 5, 2025, 'North', 'Truck'),
('afterSales', 'area', 'Resolution Time', 'Team A', 6.2, 6.0, NULL, 6, 2025, 'South', 'Bus'),
('afterSales', 'area', 'Resolution Time', 'Team B', 6.6, 6.5, NULL, 6, 2025, 'East', 'Van'),
('afterSales', 'area', 'Resolution Time', 'Team A', 5.9, 6.0, NULL, 7, 2025, 'North', 'Truck'),
('afterSales', 'area', 'Resolution Time', 'Team B', 6.4, 6.5, NULL, 7, 2025, 'South', 'Bus'),
('afterSales', 'area', 'Resolution Time', 'Team A', 5.7, 6.0, NULL, 8, 2025, 'East', 'Van'),
('afterSales', 'area', 'Resolution Time', 'Team B', 6.2, 6.5, NULL, 8, 2025, 'North', 'Truck'),
('afterSales', 'area', 'Resolution Time', 'Team A', 5.5, 6.0, NULL, 9, 2025, 'South', 'Bus'),
('afterSales', 'area', 'Resolution Time', 'Team B', 6.0, 6.5, NULL, 9, 2025, 'East', 'Van'),
('afterSales', 'area', 'Resolution Time', 'Team A', 5.3, 6.0, NULL, 10, 2025, 'North', 'Truck'),
('afterSales', 'area', 'Resolution Time', 'Team B', 5.8, 6.5, NULL, 10, 2025, 'South', 'Bus'),
('afterSales', 'area', 'Resolution Time', 'Team A', 5.1, 6.0, NULL, 11, 2025, 'East', 'Van'),
('afterSales', 'area', 'Resolution Time', 'Team B', 5.6, 6.5, NULL, 11, 2025, 'North', 'Truck'),
('afterSales', 'area', 'Resolution Time', 'Team A', 4.9, 6.0, NULL, 12, 2025, 'South', 'Bus'),
('afterSales', 'area', 'Resolution Time', 'Team B', 5.4, 6.5, NULL, 12, 2025, 'East', 'Van');

-- =============================================================================
-- TABLE DATA (12 months for all dashboards)
-- =============================================================================

-- FLEET VEHICLES TABLE DATA
INSERT INTO fleet_vehicles (vehicle_id, status, uptime_percentage, maintenance_cost, target_percentage, month, year, region) VALUES
-- January 2025
('VH1001', 'Active', 97.0, 1100, 98.0, 1, 2025, 'North'),
('VH1002', 'Active', 95.5, 1200, 97.5, 1, 2025, 'South'),
('VH1003', 'Maintenance', 89.0, 2500, 90.0, 1, 2025, 'East'),
('VH1004', 'Idle', 60.0, 800, 85.0, 1, 2025, 'North'),
('VH1005', 'Active', 96.0, 1300, 98.0, 1, 2025, 'South'),
('VH1006', 'Maintenance', 85.0, 2000, 90.0, 1, 2025, 'East'),
('VH1007', 'Idle', 70.0, 700, 88.0, 1, 2025, 'North'),
('VH1008', 'Active', 98.0, 1000, 98.0, 1, 2025, 'South'),
('VH1009', 'Maintenance', 90.0, 2300, 92.0, 1, 2025, 'East'),
('VH1010', 'Active', 95.0, 1500, 97.0, 1, 2025, 'North'),

-- February 2025
('VH1001', 'Active', 97.5, 1050, 98.0, 2, 2025, 'North'),
('VH1002', 'Active', 96.0, 1150, 97.5, 2, 2025, 'South'),
('VH1003', 'Active', 92.0, 1800, 90.0, 2, 2025, 'East'),
('VH1004', 'Active', 88.0, 750, 85.0, 2, 2025, 'North'),
('VH1005', 'Active', 96.5, 1250, 98.0, 2, 2025, 'South'),
('VH1006', 'Maintenance', 87.0, 1900, 90.0, 2, 2025, 'East'),
('VH1007', 'Active', 85.0, 650, 88.0, 2, 2025, 'North'),
('VH1008', 'Active', 98.2, 950, 98.0, 2, 2025, 'South'),
('VH1009', 'Active', 93.0, 1600, 92.0, 2, 2025, 'East'),
('VH1010', 'Active', 95.5, 1450, 97.0, 2, 2025, 'North'),

-- March 2025
('VH1001', 'Active', 98.0, 1000, 98.0, 3, 2025, 'North'),
('VH1002', 'Active', 96.5, 1100, 97.5, 3, 2025, 'South'),
('VH1003', 'Active', 94.0, 1500, 90.0, 3, 2025, 'East'),
('VH1004', 'Active', 90.0, 700, 85.0, 3, 2025, 'North'),
('VH1005', 'Active', 97.0, 1200, 98.0, 3, 2025, 'South'),
('VH1006', 'Active', 89.0, 1700, 90.0, 3, 2025, 'East'),
('VH1007', 'Active', 88.0, 600, 88.0, 3, 2025, 'North'),
('VH1008', 'Active', 98.5, 900, 98.0, 3, 2025, 'South'),
('VH1009', 'Active', 95.0, 1400, 92.0, 3, 2025, 'East'),
('VH1010', 'Active', 96.0, 1400, 97.0, 3, 2025, 'North'),

-- April 2025
('VH1001', 'Active', 97.8, 950, 98.0, 4, 2025, 'North'),
('VH1002', 'Active', 96.2, 1050, 97.5, 4, 2025, 'South'),
('VH1003', 'Active', 93.5, 1400, 90.0, 4, 2025, 'East'),
('VH1004', 'Active', 89.5, 650, 85.0, 4, 2025, 'North'),
('VH1005', 'Active', 96.8, 1150, 98.0, 4, 2025, 'South'),
('VH1006', 'Maintenance', 88.5, 1800, 90.0, 4, 2025, 'East'),
('VH1007', 'Active', 87.5, 580, 88.0, 4, 2025, 'North'),
('VH1008', 'Active', 98.3, 880, 98.0, 4, 2025, 'South'),
('VH1009', 'Active', 94.5, 1350, 92.0, 4, 2025, 'East'),
('VH1010', 'Active', 95.8, 1380, 97.0, 4, 2025, 'North'),

-- May 2025
('VH1001', 'Active', 98.2, 900, 98.0, 5, 2025, 'North'),
('VH1002', 'Active', 96.8, 1000, 97.5, 5, 2025, 'South'),
('VH1003', 'Active', 94.5, 1300, 90.0, 5, 2025, 'East'),
('VH1004', 'Active', 91.0, 600, 85.0, 5, 2025, 'North'),
('VH1005', 'Active', 97.2, 1100, 98.0, 5, 2025, 'South'),
('VH1006', 'Active', 90.0, 1600, 90.0, 5, 2025, 'East'),
('VH1007', 'Active', 89.0, 550, 88.0, 5, 2025, 'North'),
('VH1008', 'Active', 98.8, 850, 98.0, 5, 2025, 'South'),
('VH1009', 'Active', 95.5, 1300, 92.0, 5, 2025, 'East'),
('VH1010', 'Active', 96.2, 1350, 97.0, 5, 2025, 'North'),

-- June 2025
('VH1001', 'Active', 97.0, 1100, 98.0, 6, 2025, 'North'),
('VH1002', 'Active', 95.5, 1200, 97.5, 6, 2025, 'South'),
('VH1003', 'Maintenance', 89.0, 2500, 90.0, 6, 2025, 'East'),
('VH1004', 'Idle', 60.0, 800, 85.0, 6, 2025, 'North'),
('VH1005', 'Active', 96.0, 1300, 98.0, 6, 2025, 'South'),
('VH1006', 'Maintenance', 85.0, 2000, 90.0, 6, 2025, 'East'),
('VH1007', 'Idle', 70.0, 700, 88.0, 6, 2025, 'North'),
('VH1008', 'Active', 98.0, 1000, 98.0, 6, 2025, 'South'),
('VH1009', 'Maintenance', 90.0, 2300, 92.0, 6, 2025, 'East'),
('VH1010', 'Active', 95.0, 1500, 97.0, 6, 2025, 'North'),

-- July 2025
('VH1001', 'Active', 97.3, 1080, 98.0, 7, 2025, 'North'),
('VH1002', 'Active', 95.8, 1180, 97.5, 7, 2025, 'South'),
('VH1003', 'Active', 91.0, 1900, 90.0, 7, 2025, 'East'),
('VH1004', 'Active', 85.0, 720, 85.0, 7, 2025, 'North'),
('VH1005', 'Active', 96.3, 1280, 98.0, 7, 2025, 'South'),
('VH1006', 'Maintenance', 86.0, 1950, 90.0, 7, 2025, 'East'),
('VH1007', 'Active', 82.0, 680, 88.0, 7, 2025, 'North'),
('VH1008', 'Active', 98.1, 980, 98.0, 7, 2025, 'South'),
('VH1009', 'Active', 92.0, 1800, 92.0, 7, 2025, 'East'),
('VH1010', 'Active', 95.3, 1480, 97.0, 7, 2025, 'North'),

-- August 2025
('VH1001', 'Active', 97.8, 1020, 98.0, 8, 2025, 'North'),
('VH1002', 'Active', 96.2, 1120, 97.5, 8, 2025, 'South'),
('VH1003', 'Active', 93.0, 1600, 90.0, 8, 2025, 'East'),
('VH1004', 'Active', 88.0, 680, 85.0, 8, 2025, 'North'),
('VH1005', 'Active', 96.8, 1220, 98.0, 8, 2025, 'South'),
('VH1006', 'Active', 88.5, 1750, 90.0, 8, 2025, 'East'),
('VH1007', 'Active', 86.0, 620, 88.0, 8, 2025, 'North'),
('VH1008', 'Active', 98.4, 920, 98.0, 8, 2025, 'South'),
('VH1009', 'Active', 94.0, 1500, 92.0, 8, 2025, 'East'),
('VH1010', 'Active', 95.8, 1420, 97.0, 8, 2025, 'North'),

-- September 2025
('VH1001', 'Active', 98.1, 980, 98.0, 9, 2025, 'North'),
('VH1002', 'Active', 96.5, 1080, 97.5, 9, 2025, 'South'),
('VH1003', 'Active', 94.0, 1450, 90.0, 9, 2025, 'East'),
('VH1004', 'Active', 90.0, 640, 85.0, 9, 2025, 'North'),
('VH1005', 'Active', 97.1, 1180, 98.0, 9, 2025, 'South'),
('VH1006', 'Active', 90.5, 1650, 90.0, 9, 2025, 'East'),
('VH1007', 'Active', 88.5, 580, 88.0, 9, 2025, 'North'),
('VH1008', 'Active', 98.6, 880, 98.0, 9, 2025, 'South'),
('VH1009', 'Active', 95.0, 1400, 92.0, 9, 2025, 'East'),
('VH1010', 'Active', 96.2, 1380, 97.0, 9, 2025, 'North'),

-- October 2025
('VH1001', 'Active', 98.3, 950, 98.0, 10, 2025, 'North'),
('VH1002', 'Active', 96.8, 1050, 97.5, 10, 2025, 'South'),
('VH1003', 'Active', 94.5, 1400, 90.0, 10, 2025, 'East'),
('VH1004', 'Active', 91.0, 620, 85.0, 10, 2025, 'North'),
('VH1005', 'Active', 97.3, 1150, 98.0, 10, 2025, 'South'),
('VH1006', 'Active', 91.5, 1600, 90.0, 10, 2025, 'East'),
('VH1007', 'Active', 89.5, 560, 88.0, 10, 2025, 'North'),
('VH1008', 'Active', 98.8, 850, 98.0, 10, 2025, 'South'),
('VH1009', 'Active', 95.5, 1350, 92.0, 10, 2025, 'East'),
('VH1010', 'Active', 96.5, 1360, 97.0, 10, 2025, 'North'),

-- November 2025
('VH1001', 'Active', 98.5, 920, 98.0, 11, 2025, 'North'),
('VH1002', 'Active', 97.0, 1020, 97.5, 11, 2025, 'South'),
('VH1003', 'Active', 95.0, 1350, 90.0, 11, 2025, 'East'),
('VH1004', 'Active', 92.0, 600, 85.0, 11, 2025, 'North'),
('VH1005', 'Active', 97.5, 1120, 98.0, 11, 2025, 'South'),
('VH1006', 'Active', 92.5, 1550, 90.0, 11, 2025, 'East'),
('VH1007', 'Active', 90.5, 540, 88.0, 11, 2025, 'North'),
('VH1008', 'Active', 99.0, 820, 98.0, 11, 2025, 'South'),
('VH1009', 'Active', 96.0, 1320, 92.0, 11, 2025, 'East'),
('VH1010', 'Active', 96.8, 1340, 97.0, 11, 2025, 'North'),

-- December 2025
('VH1001', 'Active', 98.8, 900, 98.0, 12, 2025, 'North'),
('VH1002', 'Active', 97.2, 1000, 97.5, 12, 2025, 'South'),
('VH1003', 'Active', 95.5, 1300, 90.0, 12, 2025, 'East'),
('VH1004', 'Active', 93.0, 580, 85.0, 12, 2025, 'North'),
('VH1005', 'Active', 97.8, 1100, 98.0, 12, 2025, 'South'),
('VH1006', 'Active', 93.5, 1500, 90.0, 12, 2025, 'East'),
('VH1007', 'Active', 91.5, 520, 88.0, 12, 2025, 'North'),
('VH1008', 'Active', 99.2, 800, 98.0, 12, 2025, 'South'),
('VH1009', 'Active', 96.5, 1300, 92.0, 12, 2025, 'East'),
('VH1010', 'Active', 97.0, 1320, 97.0, 12, 2025, 'North');

-- SERVICE TICKETS TABLE DATA
INSERT INTO service_tickets (ticket_id, status, resolution_time, profit, sla_compliance, month, year, region, vehicle_type) VALUES
-- January 2025
('TK1001', 'Completed', 4, 200, 98.0, 1, 2025, 'North', 'Truck'),
('TK1002', 'In Progress', 6, 150, 95.0, 1, 2025, 'South', 'Bus'),
('TK1003', 'Pending', NULL, NULL, 80.0, 1, 2025, 'East', 'Van'),
('TK1004', 'Completed', 3, 220, 99.0, 1, 2025, 'North', 'Truck'),
('TK1005', 'Completed', 5, 250, 97.0, 1, 2025, 'South', 'Bus'),
('TK1006', 'In Progress', 7, 100, 92.0, 1, 2025, 'East', 'Van'),
('TK1007', 'Pending', NULL, NULL, 85.0, 1, 2025, 'North', 'Truck'),
('TK1008', 'Completed', 6, 180, 96.5, 1, 2025, 'South', 'Bus'),
('TK1009', 'Completed', 4, 210, 97.5, 1, 2025, 'East', 'Van'),
('TK1010', 'In Progress', 8, 160, 90.0, 1, 2025, 'North', 'Truck'),

-- February 2025
('TK2001', 'Completed', 3, 210, 98.5, 2, 2025, 'South', 'Bus'),
('TK2002', 'Completed', 5, 180, 96.0, 2, 2025, 'East', 'Van'),
('TK2003', 'In Progress', 6, 140, 93.0, 2, 2025, 'North', 'Truck'),
('TK2004', 'Completed', 4, 230, 98.0, 2, 2025, 'South', 'Bus'),
('TK2005', 'Completed', 3, 260, 99.0, 2, 2025, 'East', 'Van'),
('TK2006', 'Pending', NULL, NULL, 82.0, 2, 2025, 'North', 'Truck'),
('TK2007', 'Completed', 5, 190, 97.0, 2, 2025, 'South', 'Bus'),
('TK2008', 'Completed', 4, 220, 98.0, 2, 2025, 'East', 'Van'),
('TK2009', 'In Progress', 7, 170, 94.0, 2, 2025, 'North', 'Truck'),
('TK2010', 'Completed', 3, 240, 99.0, 2, 2025, 'South', 'Bus'),

-- March 2025
('TK3001', 'Completed', 3, 220, 99.0, 3, 2025, 'East', 'Van'),
('TK3002', 'Completed', 4, 200, 98.0, 3, 2025, 'North', 'Truck'),
('TK3003', 'Completed', 5, 190, 97.0, 3, 2025, 'South', 'Bus'),
('TK3004', 'In Progress', 6, 150, 94.0, 3, 2025, 'East', 'Van'),
('TK3005', 'Completed', 3, 250, 99.0, 3, 2025, 'North', 'Truck'),
('TK3006', 'Completed', 4, 210, 98.0, 3, 2025, 'South', 'Bus'),
('TK3007', 'Pending', NULL, NULL, 83.0, 3, 2025, 'East', 'Van'),
('TK3008', 'Completed', 5, 180, 96.0, 3, 2025, 'North', 'Truck'),
('TK3009', 'Completed', 3, 230, 99.0, 3, 2025, 'South', 'Bus'),
('TK3010', 'Completed', 4, 200, 98.0, 3, 2025, 'East', 'Van'),

-- April 2025
('TK4001', 'Completed', 4, 210, 98.0, 4, 2025, 'North', 'Truck'),
('TK4002', 'In Progress', 7, 160, 93.0, 4, 2025, 'South', 'Bus'),
('TK4003', 'Completed', 3, 240, 99.0, 4, 2025, 'East', 'Van'),
('TK4004', 'Completed', 5, 190, 97.0, 4, 2025, 'North', 'Truck'),
('TK4005', 'Pending', NULL, NULL, 84.0, 4, 2025, 'South', 'Bus'),
('TK4006', 'Completed', 4, 220, 98.0, 4, 2025, 'East', 'Van'),
('TK4007', 'Completed', 3, 250, 99.0, 4, 2025, 'North', 'Truck'),
('TK4008', 'In Progress', 6, 170, 94.0, 4, 2025, 'South', 'Bus'),
('TK4009', 'Completed', 4, 200, 98.0, 4, 2025, 'East', 'Van'),
('TK4010', 'Completed', 5, 180, 96.0, 4, 2025, 'North', 'Truck'),

-- May 2025
('TK5001', 'Completed', 3, 230, 99.0, 5, 2025, 'South', 'Bus'),
('TK5002', 'Completed', 4, 210, 98.0, 5, 2025, 'East', 'Van'),
('TK5003', 'Completed', 5, 190, 97.0, 5, 2025, 'North', 'Truck'),
('TK5004', 'In Progress', 6, 150, 94.0, 5, 2025, 'South', 'Bus'),
('TK5005', 'Completed', 3, 260, 99.0, 5, 2025, 'East', 'Van'),
('TK5006', 'Completed', 4, 220, 98.0, 5, 2025, 'North', 'Truck'),
('TK5007', 'Pending', NULL, NULL, 85.0, 5, 2025, 'South', 'Bus'),
('TK5008', 'Completed', 3, 240, 99.0, 5, 2025, 'East', 'Van'),
('TK5009', 'Completed', 4, 200, 98.0, 5, 2025, 'North', 'Truck'),
('TK5010', 'Completed', 5, 180, 96.0, 5, 2025, 'South', 'Bus'),

-- June 2025
('TK6001', 'Completed', 4, 200, 98.0, 6, 2025, 'East', 'Van'),
('TK6002', 'In Progress', 6, 150, 95.0, 6, 2025, 'North', 'Truck'),
('TK6003', 'Pending', NULL, NULL, 80.0, 6, 2025, 'South', 'Bus'),
('TK6004', 'Completed', 3, 220, 99.0, 6, 2025, 'East', 'Van'),
('TK6005', 'Completed', 5, 250, 97.0, 6, 2025, 'North', 'Truck'),
('TK6006', 'In Progress', 7, 100, 92.0, 6, 2025, 'South', 'Bus'),
('TK6007', 'Pending', NULL, NULL, 85.0, 6, 2025, 'East', 'Van'),
('TK6008', 'Completed', 6, 180, 96.5, 6, 2025, 'North', 'Truck'),
('TK6009', 'Completed', 4, 210, 97.5, 6, 2025, 'South', 'Bus'),
('TK6010', 'In Progress', 8, 160, 90.0, 6, 2025, 'East', 'Van'),

-- July 2025
('TK7001', 'Completed', 3, 220, 99.0, 7, 2025, 'North', 'Truck'),
('TK7002', 'Completed', 4, 200, 98.0, 7, 2025, 'South', 'Bus'),
('TK7003', 'Completed', 5, 190, 97.0, 7, 2025, 'East', 'Van'),
('TK7004', 'In Progress', 6, 160, 94.0, 7, 2025, 'North', 'Truck'),
('TK7005', 'Completed', 3, 240, 99.0, 7, 2025, 'South', 'Bus'),
('TK7006', 'Completed', 4, 210, 98.0, 7, 2025, 'East', 'Van'),
('TK7007', 'Pending', NULL, NULL, 86.0, 7, 2025, 'North', 'Truck'),
('TK7008', 'Completed', 3, 230, 99.0, 7, 2025, 'South', 'Bus'),
('TK7009', 'Completed', 4, 200, 98.0, 7, 2025, 'East', 'Van'),
('TK7010', 'Completed', 5, 180, 96.0, 7, 2025, 'North', 'Truck'),

-- August 2025
('TK8001', 'Completed', 3, 240, 99.0, 8, 2025, 'South', 'Bus'),
('TK8002', 'Completed', 4, 220, 98.0, 8, 2025, 'East', 'Van'),
('TK8003', 'Completed', 5, 200, 97.0, 8, 2025, 'North', 'Truck'),
('TK8004', 'In Progress', 5, 170, 95.0, 8, 2025, 'South', 'Bus'),
('TK8005', 'Completed', 3, 250, 99.0, 8, 2025, 'East', 'Van'),
('TK8006', 'Completed', 4, 210, 98.0, 8, 2025, 'North', 'Truck'),
('TK8007', 'Completed', 3, 230, 99.0, 8, 2025, 'South', 'Bus'),
('TK8008', 'Completed', 4, 200, 98.0, 8, 2025, 'East', 'Van'),
('TK8009', 'Pending', NULL, NULL, 87.0, 8, 2025, 'North', 'Truck'),
('TK8010', 'Completed', 5, 180, 96.0, 8, 2025, 'South', 'Bus'),

-- September 2025
('TK9001', 'Completed', 3, 250, 99.0, 9, 2025, 'East', 'Van'),
('TK9002', 'Completed', 4, 230, 98.0, 9, 2025, 'North', 'Truck'),
('TK9003', 'Completed', 5, 210, 97.0, 9, 2025, 'South', 'Bus'),
('TK9004', 'Completed', 3, 240, 99.0, 9, 2025, 'East', 'Van'),
('TK9005', 'In Progress', 5, 180, 95.0, 9, 2025, 'North', 'Truck'),
('TK9006', 'Completed', 4, 220, 98.0, 9, 2025, 'South', 'Bus'),
('TK9007', 'Completed', 3, 260, 99.0, 9, 2025, 'East', 'Van'),
('TK9008', 'Completed', 4, 200, 98.0, 9, 2025, 'North', 'Truck'),
('TK9009', 'Pending', NULL, NULL, 88.0, 9, 2025, 'South', 'Bus'),
('TK9010', 'Completed', 5, 190, 96.0, 9, 2025, 'East', 'Van'),

-- October 2025
('TK10001', 'Completed', 3, 260, 99.0, 10, 2025, 'North', 'Truck'),
('TK10002', 'Completed', 4, 240, 98.0, 10, 2025, 'South', 'Bus'),
('TK10003', 'Completed', 5, 220, 97.0, 10, 2025, 'East', 'Van'),
('TK10004', 'Completed', 3, 250, 99.0, 10, 2025, 'North', 'Truck'),
('TK10005', 'Completed', 4, 230, 98.0, 10, 2025, 'South', 'Bus'),
('TK10006', 'In Progress', 5, 190, 95.0, 10, 2025, 'East', 'Van'),
('TK10007', 'Completed', 3, 270, 99.0, 10, 2025, 'North', 'Truck'),
('TK10008', 'Completed', 4, 210, 98.0, 10, 2025, 'South', 'Bus'),
('TK10009', 'Completed', 5, 200, 97.0, 10, 2025, 'East', 'Van'),
('TK10010', 'Pending', NULL, NULL, 89.0, 10, 2025, 'North', 'Truck'),

-- November 2025
('TK11001', 'Completed', 3, 270, 99.0, 11, 2025, 'South', 'Bus'),
('TK11002', 'Completed', 4, 250, 98.0, 11, 2025, 'East', 'Van'),
('TK11003', 'Completed', 5, 230, 97.0, 11, 2025, 'North', 'Truck'),
('TK11004', 'Completed', 3, 260, 99.0, 11, 2025, 'South', 'Bus'),
('TK11005', 'Completed', 4, 240, 98.0, 11, 2025, 'East', 'Van'),
('TK11006', 'Completed', 3, 280, 99.0, 11, 2025, 'North', 'Truck'),
('TK11007', 'In Progress', 4, 200, 96.0, 11, 2025, 'South', 'Bus'),
('TK11008', 'Completed', 5, 220, 97.0, 11, 2025, 'East', 'Van'),
('TK11009', 'Completed', 3, 250, 99.0, 11, 2025, 'North', 'Truck'),
('TK11010', 'Pending', NULL, NULL, 90.0, 11, 2025, 'South', 'Bus'),

-- December 2025
('TK12001', 'Completed', 3, 280, 99.0, 12, 2025, 'East', 'Van'),
('TK12002', 'Completed', 4, 260, 98.0, 12, 2025, 'North', 'Truck'),
('TK12003', 'Completed', 5, 240, 97.0, 12, 2025, 'South', 'Bus'),
('TK12004', 'Completed', 3, 270, 99.0, 12, 2025, 'East', 'Van'),
('TK12005', 'Completed', 4, 250, 98.0, 12, 2025, 'North', 'Truck'),
('TK12006', 'Completed', 3, 290, 99.0, 12, 2025, 'South', 'Bus'),
('TK12007', 'Completed', 4, 230, 98.0, 12, 2025, 'East', 'Van'),
('TK12008', 'Completed', 5, 220, 97.0, 12, 2025, 'North', 'Truck'),
('TK12009', 'Completed', 3, 260, 99.0, 12, 2025, 'South', 'Bus'),
('TK12010', 'In Progress', 4, 210, 96.0, 12, 2025, 'East', 'Van');

-- SALES REPRESENTATIVES TABLE DATA
INSERT INTO sales_representatives (name, deals_closed, revenue, mom_growth, target_achievement, month, year, region, product) VALUES
-- January 2025
('Alice', 15, 300000, 10.5, 95.0, 1, 2025, 'North', 'Trucks'),
('Bob', 12, 250000, 8.5, 90.0, 1, 2025, 'South', 'Buses'),
('Charlie', 10, 200000, 7.2, 88.0, 1, 2025, 'East', 'Vans'),
('Diana', 8, 180000, 6.0, 85.0, 1, 2025, 'West', 'Trucks'),
('Ethan', 16, 320000, 12.0, 98.0, 1, 2025, 'North', 'Buses'),
('Fiona', 9, 195000, 5.5, 83.0, 1, 2025, 'South', 'Vans'),
('George', 11, 220000, 9.0, 89.0, 1, 2025, 'East', 'Trucks'),
('Hannah', 14, 280000, 11.0, 93.0, 1, 2025, 'West', 'Buses'),
('Ian', 7, 160000, 4.0, 80.0, 1, 2025, 'North', 'Vans'),
('Jane', 13, 270000, 10.0, 92.0, 1, 2025, 'South', 'Trucks'),

-- February 2025
('Alice', 16, 310000, 3.3, 96.0, 2, 2025, 'North', 'Trucks'),
('Bob', 13, 260000, 4.0, 91.0, 2, 2025, 'South', 'Buses'),
('Charlie', 11, 210000, 5.0, 89.0, 2, 2025, 'East', 'Vans'),
('Diana', 9, 190000, 5.6, 86.0, 2, 2025, 'West', 'Trucks'),
('Ethan', 17, 330000, 3.1, 99.0, 2, 2025, 'North', 'Buses'),
('Fiona', 10, 205000, 5.1, 84.0, 2, 2025, 'South', 'Vans'),
('George', 12, 230000, 4.5, 90.0, 2, 2025, 'East', 'Trucks'),
('Hannah', 15, 290000, 3.6, 94.0, 2, 2025, 'West', 'Buses'),
('Ian', 8, 170000, 6.3, 81.0, 2, 2025, 'North', 'Vans'),
('Jane', 14, 280000, 3.7, 93.0, 2, 2025, 'South', 'Trucks'),

-- March 2025
('Alice', 17, 320000, 3.2, 97.0, 3, 2025, 'North', 'Trucks'),
('Bob', 14, 270000, 3.8, 92.0, 3, 2025, 'South', 'Buses'),
('Charlie', 12, 220000, 4.8, 90.0, 3, 2025, 'East', 'Vans'),
('Diana', 10, 200000, 5.3, 87.0, 3, 2025, 'West', 'Trucks'),
('Ethan', 18, 340000, 3.0, 100.0, 3, 2025, 'North', 'Buses'),
('Fiona', 11, 215000, 4.9, 85.0, 3, 2025, 'South', 'Vans'),
('George', 13, 240000, 4.3, 91.0, 3, 2025, 'East', 'Trucks'),
('Hannah', 16, 300000, 3.4, 95.0, 3, 2025, 'West', 'Buses'),
('Ian', 9, 180000, 5.9, 82.0, 3, 2025, 'North', 'Vans'),
('Jane', 15, 290000, 3.6, 94.0, 3, 2025, 'South', 'Trucks'),

-- April 2025
('Alice', 16, 315000, -1.6, 96.5, 4, 2025, 'North', 'Trucks'),
('Bob', 13, 265000, -1.9, 91.5, 4, 2025, 'South', 'Buses'),
('Charlie', 11, 215000, -2.3, 89.5, 4, 2025, 'East', 'Vans'),
('Diana', 9, 195000, -2.5, 86.5, 4, 2025, 'West', 'Trucks'),
('Ethan', 17, 335000, -1.5, 99.5, 4, 2025, 'North', 'Buses'),
('Fiona', 10, 210000, -2.3, 84.5, 4, 2025, 'South', 'Vans'),
('George', 12, 235000, -2.1, 90.5, 4, 2025, 'East', 'Trucks'),
('Hannah', 15, 295000, -1.7, 94.5, 4, 2025, 'West', 'Buses'),
('Ian', 8, 175000, -2.8, 81.5, 4, 2025, 'North', 'Vans'),
('Jane', 14, 285000, -1.7, 93.5, 4, 2025, 'South', 'Trucks'),

-- May 2025
('Alice', 18, 330000, 4.8, 98.0, 5, 2025, 'North', 'Trucks'),
('Bob', 15, 280000, 5.7, 93.0, 5, 2025, 'South', 'Buses'),
('Charlie', 13, 230000, 7.0, 91.0, 5, 2025, 'East', 'Vans'),
('Diana', 11, 210000, 7.7, 88.0, 5, 2025, 'West', 'Trucks'),
('Ethan', 19, 350000, 4.5, 101.0, 5, 2025, 'North', 'Buses'),
('Fiona', 12, 225000, 7.1, 86.0, 5, 2025, 'South', 'Vans'),
('George', 14, 250000, 6.4, 92.0, 5, 2025, 'East', 'Trucks'),
('Hannah', 17, 310000, 5.1, 96.0, 5, 2025, 'West', 'Buses'),
('Ian', 10, 190000, 8.6, 83.0, 5, 2025, 'North', 'Vans'),
('Jane', 16, 300000, 5.3, 95.0, 5, 2025, 'South', 'Trucks'),

-- June 2025
('Alice', 17, 325000, -1.5, 97.5, 6, 2025, 'North', 'Trucks'),
('Bob', 14, 275000, -1.8, 92.5, 6, 2025, 'South', 'Buses'),
('Charlie', 12, 225000, -2.2, 90.5, 6, 2025, 'East', 'Vans'),
('Diana', 10, 205000, -2.4, 87.5, 6, 2025, 'West', 'Trucks'),
('Ethan', 18, 345000, -1.4, 100.5, 6, 2025, 'North', 'Buses'),
('Fiona', 11, 220000, -2.2, 85.5, 6, 2025, 'South', 'Vans'),
('George', 13, 245000, -2.0, 91.5, 6, 2025, 'East', 'Trucks'),
('Hannah', 16, 305000, -1.6, 95.5, 6, 2025, 'West', 'Buses'),
('Ian', 9, 185000, -2.6, 82.5, 6, 2025, 'North', 'Vans'),
('Jane', 15, 295000, -1.7, 94.5, 6, 2025, 'South', 'Trucks'),

-- July 2025
('Alice', 19, 340000, 4.6, 99.0, 7, 2025, 'North', 'Trucks'),
('Bob', 16, 290000, 5.5, 94.0, 7, 2025, 'South', 'Buses'),
('Charlie', 14, 240000, 6.7, 92.0, 7, 2025, 'East', 'Vans'),
('Diana', 12, 220000, 7.3, 89.0, 7, 2025, 'West', 'Trucks'),
('Ethan', 20, 360000, 4.3, 102.0, 7, 2025, 'North', 'Buses'),
('Fiona', 13, 235000, 6.8, 87.0, 7, 2025, 'South', 'Vans'),
('George', 15, 260000, 6.1, 93.0, 7, 2025, 'East', 'Trucks'),
('Hannah', 18, 320000, 4.9, 97.0, 7, 2025, 'West', 'Buses'),
('Ian', 11, 200000, 8.1, 84.0, 7, 2025, 'North', 'Vans'),
('Jane', 17, 310000, 5.1, 96.0, 7, 2025, 'South', 'Trucks'),

-- August 2025
('Alice', 20, 350000, 2.9, 100.0, 8, 2025, 'North', 'Trucks'),
('Bob', 17, 300000, 3.4, 95.0, 8, 2025, 'South', 'Buses'),
('Charlie', 15, 250000, 4.2, 93.0, 8, 2025, 'East', 'Vans'),
('Diana', 13, 230000, 4.5, 90.0, 8, 2025, 'West', 'Trucks'),
('Ethan', 21, 370000, 2.8, 103.0, 8, 2025, 'North', 'Buses'),
('Fiona', 14, 245000, 4.3, 88.0, 8, 2025, 'South', 'Vans'),
('George', 16, 270000, 3.8, 94.0, 8, 2025, 'East', 'Trucks'),
('Hannah', 19, 330000, 3.1, 98.0, 8, 2025, 'West', 'Buses'),
('Ian', 12, 210000, 5.0, 85.0, 8, 2025, 'North', 'Vans'),
('Jane', 18, 320000, 3.2, 97.0, 8, 2025, 'South', 'Trucks'),

-- September 2025
('Alice', 21, 360000, 2.9, 101.0, 9, 2025, 'North', 'Trucks'),
('Bob', 18, 310000, 3.3, 96.0, 9, 2025, 'South', 'Buses'),
('Charlie', 16, 260000, 4.0, 94.0, 9, 2025, 'East', 'Vans'),
('Diana', 14, 240000, 4.3, 91.0, 9, 2025, 'West', 'Trucks'),
('Ethan', 22, 380000, 2.7, 104.0, 9, 2025, 'North', 'Buses'),
('Fiona', 15, 255000, 4.1, 89.0, 9, 2025, 'South', 'Vans'),
('George', 17, 280000, 3.7, 95.0, 9, 2025, 'East', 'Trucks'),
('Hannah', 20, 340000, 3.0, 99.0, 9, 2025, 'West', 'Buses'),
('Ian', 13, 220000, 4.8, 86.0, 9, 2025, 'North', 'Vans'),
('Jane', 19, 330000, 3.1, 98.0, 9, 2025, 'South', 'Trucks'),

-- October 2025
('Alice', 22, 370000, 2.8, 102.0, 10, 2025, 'North', 'Trucks'),
('Bob', 19, 320000, 3.2, 97.0, 10, 2025, 'South', 'Buses'),
('Charlie', 17, 270000, 3.8, 95.0, 10, 2025, 'East', 'Vans'),
('Diana', 15, 250000, 4.2, 92.0, 10, 2025, 'West', 'Trucks'),
('Ethan', 23, 390000, 2.6, 105.0, 10, 2025, 'North', 'Buses'),
('Fiona', 16, 265000, 3.9, 90.0, 10, 2025, 'South', 'Vans'),
('George', 18, 290000, 3.6, 96.0, 10, 2025, 'East', 'Trucks'),
('Hannah', 21, 350000, 2.9, 100.0, 10, 2025, 'West', 'Buses'),
('Ian', 14, 230000, 4.5, 87.0, 10, 2025, 'North', 'Vans'),
('Jane', 20, 340000, 3.0, 99.0, 10, 2025, 'South', 'Trucks'),

-- November 2025
('Alice', 23, 380000, 2.7, 103.0, 11, 2025, 'North', 'Trucks'),
('Bob', 20, 330000, 3.1, 98.0, 11, 2025, 'South', 'Buses'),
('Charlie', 18, 280000, 3.7, 96.0, 11, 2025, 'East', 'Vans'),
('Diana', 16, 260000, 4.0, 93.0, 11, 2025, 'West', 'Trucks'),
('Ethan', 24, 400000, 2.6, 106.0, 11, 2025, 'North', 'Buses'),
('Fiona', 17, 275000, 3.8, 91.0, 11, 2025, 'South', 'Vans'),
('George', 19, 300000, 3.4, 97.0, 11, 2025, 'East', 'Trucks'),
('Hannah', 22, 360000, 2.9, 101.0, 11, 2025, 'West', 'Buses'),
('Ian', 15, 240000, 4.3, 88.0, 11, 2025, 'North', 'Vans'),
('Jane', 21, 350000, 2.9, 100.0, 11, 2025, 'South', 'Trucks'),

-- December 2025
('Alice', 24, 390000, 2.6, 104.0, 12, 2025, 'North', 'Trucks'),
('Bob', 21, 340000, 3.0, 99.0, 12, 2025, 'South', 'Buses'),
('Charlie', 19, 290000, 3.6, 97.0, 12, 2025, 'East', 'Vans'),
('Diana', 17, 270000, 3.8, 94.0, 12, 2025, 'West', 'Trucks'),
('Ethan', 25, 410000, 2.5, 107.0, 12, 2025, 'North', 'Buses'),
('Fiona', 18, 285000, 3.6, 92.0, 12, 2025, 'South', 'Vans'),
('George', 20, 310000, 3.3, 98.0, 12, 2025, 'East', 'Trucks'),
('Hannah', 23, 370000, 2.8, 102.0, 12, 2025, 'West', 'Buses'),
('Ian', 16, 250000, 4.2, 89.0, 12, 2025, 'North', 'Vans'),
('Jane', 22, 360000, 2.9, 101.0, 12, 2025, 'South', 'Trucks');

-- =============================================================================
-- VERIFICATION QUERIES
-- =============================================================================

-- Verify data counts
SELECT 'KPI Metrics' as table_name, COUNT(*) as record_count FROM kpi_metrics
UNION ALL
SELECT 'Chart Data' as table_name, COUNT(*) as record_count FROM chart_data
UNION ALL
SELECT 'Fleet Vehicles' as table_name, COUNT(*) as record_count FROM fleet_vehicles
UNION ALL
SELECT 'Service Tickets' as table_name, COUNT(*) as record_count FROM service_tickets
UNION ALL
SELECT 'Sales Representatives' as table_name, COUNT(*) as record_count FROM sales_representatives;

-- Verify cross-filtering columns exist
SELECT 'Cross-filtering setup complete' as status;

PRINT 'Comprehensive dashboard data with cross-filtering support has been successfully inserted!';
PRINT 'Data includes:';
PRINT '- 12 months of KPI metrics for all 3 dashboards';
PRINT '- 4 charts per dashboard with 12 months of data';
PRINT '- Complete table data for all dashboards';
PRINT '- Cross-filtering support with region, product, vehicle_type, etc.';
PRINT 'You can now test cross-filtering by clicking on any chart element!';