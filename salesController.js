const db = require('../config/db');

exports.getKPIs = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    // Build dynamic WHERE clause for cross-filtering
    let whereClause = 'WHERE dashboard_type = @param0 AND month = @param1 AND year = @param2';
    let params = ['sales', month, year];
    let paramIndex = 3;

    // Add cross-filter conditions
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }
    if (crossFilters.product) {
      whereClause += ` AND product = @param${paramIndex}`;
      params.push(crossFilters.product);
      paramIndex++;
    }
    if (crossFilters.stage) {
      whereClause += ` AND stage = @param${paramIndex}`;
      params.push(crossFilters.stage);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM kpi_metrics ${whereClause}`,
      params
    );
    res.json(rows);
  } catch (error) {
    console.error('Error fetching sales KPIs:', error);
    res.status(500).json({ error: 'Failed to fetch KPIs' });
  }
};

exports.getSalesGrowthChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['sales', 'line', 'Monthly Revenue', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }
    if (crossFilters.product) {
      whereClause += ` AND product = @param${paramIndex}`;
      params.push(crossFilters.product);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    res.json({
      name: "Monthly Revenue",
      chart_type: "line",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value,
        additional_value: row.additional_value
      }))
    });
  } catch (error) {
    console.error('Error fetching sales growth chart:', error);
    res.status(500).json({ error: 'Failed to fetch sales growth data' });
  }
};

exports.getProductSalesChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    console.log('Fetching product sales chart data:', { month, year, crossFilters });
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['sales', 'pie', 'Client Type Distribution', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }
    if (crossFilters.stage) {
      whereClause += ` AND stage = @param${paramIndex}`;
      params.push(crossFilters.stage);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    console.log('Product sales chart query result:', rows);
    
    res.json({
      name: "Client Type Distribution",
      chart_type: "pie",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value,
        color: row.color
      }))
    });
  } catch (error) {
    console.error('Error fetching product sales chart:', error);
    res.status(500).json({ error: 'Failed to fetch product sales data' });
  }
};

exports.getRegionSalesChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    console.log('Fetching region sales chart data:', { month, year, crossFilters });
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['sales', 'bar', 'Sales by Rep', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.product) {
      whereClause += ` AND product = @param${paramIndex}`;
      params.push(crossFilters.product);
      paramIndex++;
    }
    if (crossFilters.stage) {
      whereClause += ` AND stage = @param${paramIndex}`;
      params.push(crossFilters.stage);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    console.log('Region sales chart query result:', rows);
    
    res.json({
      name: "Sales by Region vs Target",
      chart_type: "bar",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value,
        additional_value: row.additional_value
      }))
    });
  } catch (error) {
    console.error('Error fetching region sales chart:', error);
    res.status(500).json({ error: 'Failed to fetch region sales data' });
  }
};

exports.getConversionFunnelChart = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    console.log('Fetching conversion funnel chart data:', { month, year, crossFilters });
    
    let whereClause = 'WHERE dashboard_type = @param0 AND chart_type = @param1 AND name = @param2 AND month = @param3 AND year = @param4';
    let params = ['sales', 'area', 'Revenue Growth', month, year];
    let paramIndex = 5;

    // Add cross-filter conditions
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }
    if (crossFilters.product) {
      whereClause += ` AND product = @param${paramIndex}`;
      params.push(crossFilters.product);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM chart_data ${whereClause}`,
      params
    );
    
    console.log('Conversion funnel chart query result:', rows);
    
    res.json({
      name: "Revenue Growth",
      chart_type: "area",
      data: rows.map(row => ({
        data_point_name: row.data_point_name,
        data_point_value: row.data_point_value
      }))
    });
  } catch (error) {
    console.error('Error fetching conversion funnel chart:', error);
    res.status(500).json({ error: 'Failed to fetch conversion funnel data' });
  }
};

exports.getSalesRepTable = async (req, res) => {
  try {
    const { month, year, ...crossFilters } = req.query;
    
    let whereClause = 'WHERE month = @param0 AND year = @param1';
    let params = [month, year];
    let paramIndex = 2;

    // Add cross-filter conditions
    if (crossFilters.region) {
      whereClause += ` AND region = @param${paramIndex}`;
      params.push(crossFilters.region);
      paramIndex++;
    }
    if (crossFilters.product) {
      whereClause += ` AND product = @param${paramIndex}`;
      params.push(crossFilters.product);
      paramIndex++;
    }

    const rows = await db.executeQuery(
      `SELECT * FROM sales_representatives ${whereClause}`,
      params
    );
    
    res.json({
      headers: ['Sales Rep', 'Deals Closed', 'Revenue', 'MoM Growth', 'Target Achievement'],
      rows: rows.map(row => ({
        'Sales Rep': row.name,
        'Deals Closed': row.deals_closed,
        'Revenue': row.revenue,
        'MoM Growth': row.mom_growth,
        'Target Achievement': row.target_achievement
      }))
    });
  } catch (error) {
    console.error('Error fetching sales rep table:', error);
    res.status(500).json({ error: 'Failed to fetch sales rep data' });
  }
};