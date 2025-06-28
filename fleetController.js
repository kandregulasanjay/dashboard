const db = require('../config/db');

exports.getKPIs = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    // Build dynamic WHERE clause for cross-filtering
    let whereClause = 'WHERE dashboard_type = @param0 AND month = @param1 AND year = @param2';
    let params = ['fleet', month, year];
    let paramIndex = 3;

    // Add cross-filter conditions
    if (crossFilters.vehicle_id) {
      whereClause += ` AND vehicle_id = @param${paramIndex}`;
      params.push(crossFilters.vehicle_id);
      paramIndex++;
    }
    if (crossFilters.status) {
      whereClause += ` AND status = @param${paramIndex}`;
      params.push(crossFilters.status);
      paramIndex++;
    }
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM kpi_metrics ${whereClause}`,
      params
    );
    res.json(rows);
  } catch (error) {
    console.error('Error fetching fleet KPIs:', error);
    res.status(500).json({ error: 'Failed to fetch KPIs' });
  }
};

exports.getUtilizationChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['fleet', 'line', 'Fleet Uptime', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.status) {
      whereClause += ` AND status = @param${paramIndex}`;
      params.push(crossFilters.status);
      paramIndex++;
    }
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }
    if (crossFilters.vehicle_id) {
      whereClause += ` AND vehicle_id = @param${paramIndex}`;
      params.push(crossFilters.vehicle_id);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    res.json({
      name: "Fleet Utilization Trend",
      chart_type: "line",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value,
        additional_value: row.additional_value,
        color: row.color
      }))
    });
  } catch (error) {
    console.error('Error fetching utilization chart:', error);
    res.status(500).json({ error: 'Failed to fetch utilization data' });
  }
};

exports.getVehicleTypesChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['fleet', 'pie', 'Vehicle Distribution', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.vehicle_id) {
      whereClause += ` AND vehicle_id = @param${paramIndex}`;
      params.push(crossFilters.vehicle_id);
      paramIndex++;
    }
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    res.json({
      name: "Vehicle Types Breakdown",
      chart_type: "pie",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value,
        color: row.color
      }))
    });
  } catch (error) {
    console.error('Error fetching vehicle types chart:', error);
    res.status(500).json({ error: 'Failed to fetch vehicle types data' });
  }
};

exports.getMaintenanceChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['fleet', 'area', 'Maintenance Costs', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.vehicle_id) {
      whereClause += ` AND vehicle_id = @param${paramIndex}`;
      params.push(crossFilters.vehicle_id);
      paramIndex++;
    }
    if (crossFilters.status) {
      whereClause += ` AND status = @param${paramIndex}`;
      params.push(crossFilters.status);
      paramIndex++;
    }
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    res.json({
      name: "Maintenance Costs vs Target",
      chart_type: "bar",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value,
        additional_value: row.additional_value
      }))
    });
  } catch (error) {
    console.error('Error fetching maintenance chart:', error);
    res.status(500).json({ error: 'Failed to fetch maintenance data' });
  }
};

exports.getRegionalChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['fleet', 'bar', 'Vehicle Status', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.vehicle_id) {
      whereClause += ` AND vehicle_id = @param${paramIndex}`;
      params.push(crossFilters.vehicle_id);
      paramIndex++;
    }
    if (crossFilters.status) {
      whereClause += ` AND status = @param${paramIndex}`;
      params.push(crossFilters.status);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    res.json({
      name: "Regional Vehicle Activity",
      chart_type: "area",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value,
        additional_value: row.additional_value
      }))
    });
  } catch (error) {
    console.error('Error fetching regional chart:', error);
    res.status(500).json({ error: 'Failed to fetch regional data' });
  }
};

exports.getVehicleTable = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE month = @param0 AND year = @param1';
    let params = [month, year];
    let paramIndex = 2;

    // Add cross-filter conditions
    if (crossFilters.vehicle_id) {
      whereClause += ` AND vehicle_id = @param${paramIndex}`;
      params.push(crossFilters.vehicle_id);
      paramIndex++;
    }
    if (crossFilters.status) {
      whereClause += ` AND status = @param${paramIndex}`;
      params.push(crossFilters.status);
      paramIndex++;
    }
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM fleet_vehicles ${whereClause}`,
      params
    );
    
    res.json({
      headers: ['Vehicle', 'Status', 'Uptime (%)', 'Maintenance Cost', 'Target vs Actual'],
      rows: rows.map(row => ({
        'Vehicle': row.vehicle_id,
        'Status': row.status,
        'Uptime (%)': row.uptime_percentage,
        'Maintenance Cost': row.maintenance_cost,
        'Target vs Actual': ((row.uptime_percentage - row.target_percentage) || 0).toFixed(1)
      }))
    });
  } catch (error) {
    console.error('Error fetching vehicle table:', error);
    res.status(500).json({ error: 'Failed to fetch vehicle data' });
  }
};