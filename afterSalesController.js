const db = require('../config/db');

exports.getKPIs = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    // Build dynamic WHERE clause for cross-filtering
    let whereClause = 'WHERE dashboard_type = @param0 AND month = @param1 AND year = @param2';
    let params = ['afterSales', month, year];
    let paramIndex = 3;

    // Add cross-filter conditions
    if (crossFilters.status) {
      whereClause += ` AND status = @param${paramIndex}`;
      params.push(crossFilters.status);
      paramIndex++;
    }
    if (crossFilters.vehicle_type) {
      whereClause += ` AND vehicle_type = @param${paramIndex}`;
      params.push(crossFilters.vehicle_type);
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
    console.error('Error fetching after-sales KPIs:', error);
    res.status(500).json({ error: 'Failed to fetch KPIs' });
  }
};

exports.getRevenueChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['afterSales', 'line', 'SLA Compliance', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }
    if (crossFilters.vehicle_type) {
      whereClause += ` AND vehicle_type = @param${paramIndex}`;
      params.push(crossFilters.vehicle_type);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    res.json({
      name: "Revenue Trend",
      chart_type: "line",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value,
        additional_value: row.additional_value
      }))
    });
  } catch (error) {
    console.error('Error fetching revenue chart:', error);
    res.status(500).json({ error: 'Failed to fetch revenue data' });
  }
};

exports.getTicketStatusChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['afterSales', 'bar', 'Tickets by Status', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.vehicle_type) {
      whereClause += ` AND vehicle_type = @param${paramIndex}`;
      params.push(crossFilters.vehicle_type);
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
      name: "Ticket Status Distribution",
      chart_type: "pie",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value,
        color: row.color
      }))
    });
  } catch (error) {
    console.error('Error fetching ticket status chart:', error);
    res.status(500).json({ error: 'Failed to fetch ticket status data' });
  }
};

exports.getCostByVehicleChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['afterSales', 'pie', 'Issue Category', month, year];
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

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    res.json({
      name: "Service Costs by Vehicle Type",
      chart_type: "bar",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value
      }))
    });
  } catch (error) {
    console.error('Error fetching cost by vehicle chart:', error);
    res.status(500).json({ error: 'Failed to fetch cost by vehicle data' });
  }
};

exports.getRegionalDowntimeChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['afterSales', 'area', 'Resolution Time', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.status) {
      whereClause += ` AND status = @param${paramIndex}`;
      params.push(crossFilters.status);
      paramIndex++;
    }
    if (crossFilters.vehicle_type) {
      whereClause += ` AND vehicle_type = @param${paramIndex}`;
      params.push(crossFilters.vehicle_type);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    res.json({
      name: "Average Downtime by Region",
      chart_type: "area",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value
      }))
    });
  } catch (error) {
    console.error('Error fetching regional downtime chart:', error);
    res.status(500).json({ error: 'Failed to fetch regional downtime data' });
  }
};

exports.getTicketsTable = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE month = @param0 AND year = @param1';
    let params = [month, year];
    let paramIndex = 2;

    // Add cross-filter conditions
    if (crossFilters.status) {
      whereClause += ` AND status = @param${paramIndex}`;
      params.push(crossFilters.status);
      paramIndex++;
    }
    if (crossFilters.vehicle_type) {
      whereClause += ` AND vehicle_type = @param${paramIndex}`;
      params.push(crossFilters.vehicle_type);
      paramIndex++;
    }
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM service_tickets ${whereClause}`,
      params
    );
    
    res.json({
      headers: ['Ticket ID', 'Status', 'Resolution Time', 'Profit', 'SLA Compliance'],
      rows: rows.map(row => ({
        'Ticket ID': row.ticket_id,
        'Status': row.status,
        'Resolution Time': row.resolution_time ? `${row.resolution_time}h` : '-',
        'Profit': row.profit || 0,
        'SLA Compliance': row.sla_compliance
      }))
    });
  } catch (error) {
    console.error('Error fetching tickets table:', error);
    res.status(500).json({ error: 'Failed to fetch tickets data' });
  }
};