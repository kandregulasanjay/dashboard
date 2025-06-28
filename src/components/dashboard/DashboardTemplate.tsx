import { useState } from 'react';
import { Truck, Activity, Wrench, Clock, Target, DollarSign, Ticket, TrendingUp, CheckCircle, Users, Award } from 'lucide-react';
import KPICard from '@/components/ui/kpi-card';
import DashboardFilters, { FilterState } from './DashboardFilters';
import { useDashboardData } from '@/hooks/useDashboardData';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, PieChart, Pie, Cell, BarChart, Bar, AreaChart, Area } from 'recharts';
import { ChartData, TableRow } from '@/services/api';

// Icon mapping
const iconMap = {
  Truck,
  Activity,
  Wrench,
  Clock,
  Target,
  DollarSign,
  Ticket,
  TrendingUp,
  CheckCircle,
  Users,
  Award
};

interface DashboardTemplateProps {
  type: 'fleet' | 'afterSales' | 'sales';
  title: string;
  description: string;
}

const DashboardTemplate = ({ type, title, description }: DashboardTemplateProps) => {
  const currentDate = new Date();
  const [filters, setFilters] = useState<FilterState>({
    month: currentDate.getMonth() + 1,
    year: currentDate.getFullYear()
  });
  const [crossFilter, setCrossFilter] = useState<{ [key: string]: string | number } | null>(null);

  const filterParams = {
    month: filters.month,
    year: filters.year,
    ...crossFilter 
  };

  const { data, isLoading, error } = useDashboardData(type, filterParams);

  const handleChartClick = (chartName: string, dataPoint: any) => {
    if (!dataPoint || !dataPoint.activePayload) return;
    
    const payload = dataPoint.activePayload[0]?.payload;
    if (!payload) return;

    const filterKey = getFilterKeyForChart(chartName, type);
    const filterValue = payload.data_point_name;

    if (crossFilter && crossFilter[filterKey] === filterValue) {
      // Remove filter if clicking the same item
      setCrossFilter(null);
    } else {
      // Apply new filter
      setCrossFilter({ [filterKey]: filterValue });
    }
  };

  const clearCrossFilter = () => {
    setCrossFilter(null);
  };

  if (error) {
    return (
      <div className="h-screen flex flex-col overflow-hidden">
        <div className="p-4">
          <h1 className="text-2xl font-bold text-slate-900 dark:text-white mb-1">{title}</h1>
          <p className="text-slate-600 dark:text-slate-300 text-sm">{description}</p>
        </div>
        <div className="flex-1 flex items-center justify-center">
          <div className="bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800 rounded-xl p-6 max-w-md">
            <h3 className="text-lg font-semibold text-red-800 dark:text-red-200 mb-2">Error Loading Data</h3>
            <p className="text-red-600 dark:text-red-300">{error}</p>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="h-screen flex flex-col overflow-hidden">
      {/* Combined Header Card with Title and Filters */}
      <div className="flex-shrink-0 p-4 pb-2">
        <div className="bg-white dark:bg-slate-800 rounded-lg p-4 shadow-sm border border-slate-200 dark:border-slate-700">
          <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4">
            {/* Title Section */}
            <div className="flex-shrink-0">
              <h1 className="text-2xl font-bold text-slate-900 dark:text-white">{title}</h1>
              <p className="text-slate-600 dark:text-slate-300 text-sm">{description}</p>
            </div>
            
            {/* Filters Section */}
            <div className="flex-shrink-0 lg:max-w-2xl">
              <DashboardFilters
                filters={filters}
                onFiltersChange={setFilters}
                isLoading={isLoading}
                crossFilter={crossFilter}
                onClearCrossFilter={clearCrossFilter}
                dashboardType={type}
                showCard={false} // Don't show the card wrapper since we're already in a card
              />
            </div>
          </div>
        </div>
      </div>

      {/* Main Content Area */}
      <div className="flex-1 overflow-auto px-4 pb-4">
        <div className="space-y-3">
          {/* Compact KPI Cards */}
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-3">
            {data.kpis.slice(0, 5).map((kpi, index) => {
              const IconComponent = iconMap[kpi.icon as keyof typeof iconMap];
              return (
                <div key={index} className="bg-white dark:bg-slate-800 rounded-lg p-3 shadow-sm border border-slate-200 dark:border-slate-700 hover:shadow-md transition-all duration-200">
                  <div className="flex items-center justify-between mb-2">
                    <h3 className="text-xs font-medium text-slate-600 dark:text-slate-300 truncate">{kpi.title}</h3>
                    {IconComponent && <IconComponent size={14} className="text-slate-400 dark:text-slate-500 flex-shrink-0" />}
                  </div>
                  
                  <div className="flex items-end justify-between">
                    <div className="min-w-0 flex-1">
                      <div className="text-lg font-bold text-slate-900 dark:text-white truncate">
                        {typeof kpi.value === 'number' ? kpi.value.toLocaleString() : kpi.value}
                      </div>
                      {kpi.previous_value && (
                        <div className="text-xs text-slate-500 dark:text-slate-400 truncate">
                          Prev: {typeof kpi.previous_value === 'number' ? kpi.previous_value.toLocaleString() : kpi.previous_value}
                        </div>
                      )}
                    </div>
                    
                    {kpi.trend_value && (
                      <div className={`flex items-center space-x-1 flex-shrink-0 ml-2 ${
                        kpi.trend === 'up' ? 'text-green-600' : kpi.trend === 'down' ? 'text-red-600' : 'text-slate-600'
                      }`}>
                        <span className="text-xs font-medium">{kpi.trend_value}</span>
                        <span className="text-xs">{kpi.trend === 'up' ? '↑' : kpi.trend === 'down' ? '↓' : '→'}</span>
                      </div>
                    )}
                  </div>
                </div>
              );
            })}
          </div>

          {/* Compact Charts Section */}
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-3">
            {data.charts.map((chart, index) => {
              const chartElement = renderChart(chart, (dataPoint) => handleChartClick(chart.name, dataPoint));
              return (
                <div key={index} className="bg-white dark:bg-slate-800 rounded-lg p-4 shadow-sm border border-slate-200 dark:border-slate-700">
                  <h3 className="text-sm font-semibold text-slate-900 dark:text-white mb-3 truncate">{chart.name}</h3>
                  {isLoading ? (
                    <div className="h-[200px] flex items-center justify-center">
                      <div className="animate-spin rounded-full h-6 w-6 border-b-2 border-primary"></div>
                    </div>
                  ) : !chart.data || chart.data.length === 0 ? (
                    <div className="h-[200px] flex items-center justify-center flex-col">
                      <div className="text-slate-400 dark:text-slate-500 mb-1 text-sm">No data available</div>
                      <div className="text-xs text-slate-400 dark:text-slate-500">Check if data exists for selected period</div>
                    </div>
                  ) : chartElement ? (
                    <ResponsiveContainer width="100%" height={200}>
                      {chartElement}
                    </ResponsiveContainer>
                  ) : (
                    <div className="h-[200px] flex items-center justify-center text-slate-400 dark:text-slate-500 text-sm">
                      Unsupported chart type
                    </div>
                  )}
                </div>
              );
            })}
          </div>

          {/* Compact Data Table */}
          <div className="bg-white dark:bg-slate-800 rounded-lg p-4 shadow-sm border border-slate-200 dark:border-slate-700">
            <h3 className="text-sm font-semibold text-slate-900 dark:text-white mb-3">
              {type === 'fleet' ? 'Vehicle Performance Overview' : 
               type === 'afterSales' ? 'Service Tickets Overview' : 
               'Sales Team Performance'}
            </h3>
            {isLoading ? (
              <div className="h-24 flex items-center justify-center">
                <div className="animate-spin rounded-full h-6 w-6 border-b-2 border-primary"></div>
              </div>
            ) : (
              <div className="overflow-x-auto max-h-[300px] overflow-y-auto">
                <table className="w-full text-xs">
                  <thead className="sticky top-0 bg-white dark:bg-slate-800">
                    <tr className="border-b border-slate-200 dark:border-slate-700">
                      {data.table.headers.map((header, index) => (
                        <th key={index} className="text-left py-2 px-3 font-medium text-slate-600 dark:text-slate-300">
                          {header}
                        </th>
                      ))}
                    </tr>
                  </thead>
                  <tbody>
                    {data.table.rows.slice(0, 10).map((row, rowIndex) => (
                      <tr key={rowIndex} className="border-b border-slate-100 dark:border-slate-700 hover:bg-slate-50 dark:hover:bg-slate-700">
                        {renderTableRow(row, type, rowIndex)}
                      </tr>
                    ))}
                  </tbody>
                </table>
                {data.table.rows.length > 10 && (
                  <div className="text-xs text-slate-500 dark:text-slate-400 text-center py-2">
                    Showing 10 of {data.table.rows.length} records
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

// Helper function to get filter key based on chart name and dashboard type
const getFilterKeyForChart = (chartName: string, dashboardType: string): string => {
  const chartFilterMap: { [key: string]: { [key: string]: string } } = {
    fleet: {
      'Fleet Utilization Trend': 'vehicle_id',
      'Vehicle Types Breakdown': 'status',
      'Maintenance Costs vs Target': 'vehicle_id',
      'Regional Vehicle Activity': 'region'
    },
    afterSales: {
      'Revenue Trend': 'month',
      'Ticket Status Distribution': 'status',
      'Service Costs by Vehicle Type': 'vehicle_type',
      'Average Downtime by Region': 'region'
    },
    sales: {
      'Sales Growth (YoY)': 'month',
      'Product-wise Sales Distribution': 'product',
      'Sales by Region vs Target': 'region',
      'Lead to Sales Funnel': 'stage'
    }
  };

  return chartFilterMap[dashboardType]?.[chartName] || 'category';
};

// Helper function to render different chart types with click handlers
const renderChart = (chart: ChartData, onChartClick: (dataPoint: any) => void) => {
  switch (chart.chart_type) {
    case 'line':
      return (
        <LineChart data={chart.data} onClick={onChartClick}>
          <CartesianGrid strokeDasharray="3 3" stroke="#e2e8f0" />
          <XAxis dataKey="data_point_name" stroke="#64748b" fontSize={10} />
          <YAxis stroke="#64748b" fontSize={10} />
          <Tooltip 
            contentStyle={{ 
              backgroundColor: '#ffffff', 
              border: '1px solid #e2e8f0',
              borderRadius: '8px',
              fontSize: '12px'
            }} 
          />
          <Line 
            type="monotone" 
            dataKey="data_point_value"
            stroke="#2563EB" 
            strokeWidth={2}
            dot={{ fill: '#2563EB', strokeWidth: 2, r: 3 }}
          />
        </LineChart>
      );
    case 'pie':
      return (
        <PieChart onClick={onChartClick}>
          <Pie
            data={chart.data}
            cx="50%"
            cy="50%"
            innerRadius={40}
            outerRadius={80}
            paddingAngle={2}
            dataKey="data_point_value"
          >
            {chart.data.map((entry, i) => (
              <Cell 
                key={`cell-${i}`} 
                fill={entry.color || '#2563EB'} 
                style={{ cursor: 'pointer' }}
              />
            ))}
          </Pie>
          <Tooltip contentStyle={{ fontSize: '12px' }} />
        </PieChart>
      );
    case 'bar':
      return (
        <BarChart data={chart.data} onClick={onChartClick}>
          <CartesianGrid strokeDasharray="3 3" stroke="#e2e8f0" />
          <XAxis dataKey="data_point_name" stroke="#64748b" fontSize={10} />
          <YAxis stroke="#64748b" fontSize={10} />
          <Tooltip 
            contentStyle={{ 
              backgroundColor: '#ffffff', 
              border: '1px solid #e2e8f0',
              borderRadius: '8px',
              fontSize: '12px'
            }} 
          />
          <Bar 
            dataKey="data_point_value" 
            fill="#2563EB" 
            radius={[2, 2, 0, 0]}
            style={{ cursor: 'pointer' }}
          />
        </BarChart>
      );
    case 'area':
      return (
        <AreaChart data={chart.data} onClick={onChartClick}>
          <CartesianGrid strokeDasharray="3 3" stroke="#e2e8f0" />
          <XAxis dataKey="data_point_name" stroke="#64748b" fontSize={10} />
          <YAxis stroke="#64748b" fontSize={10} />
          <Tooltip 
            contentStyle={{ 
              backgroundColor: '#ffffff', 
              border: '1px solid #e2e8f0',
              borderRadius: '8px',
              fontSize: '12px'
            }} 
          />
          <Area 
            type="monotone" 
            dataKey="data_point_value" 
            stackId="1" 
            stroke="#2563EB" 
            fill="#2563EB" 
            fillOpacity={0.6}
            style={{ cursor: 'pointer' }}
          />
          {chart.data[0]?.additional_value !== undefined && (
            <Area 
              type="monotone" 
              dataKey="additional_value" 
              stackId="1" 
              stroke="#10B981" 
              fill="#10B981" 
              fillOpacity={0.6}
              style={{ cursor: 'pointer' }}
            />
          )}
        </AreaChart>
      );
    default:
      return null;
  }
};

// Helper function to render table rows based on dashboard type
const renderTableRow = (row: TableRow, type: string, index: number) => {
  const numericValue = (value: string | number) => typeof value === 'string' ? parseFloat(value) : value;
  const stringValue = (value: string | number) => value.toString();

  switch (type) {
    case 'fleet':
      return (
        <>
          <td className="py-2 px-3 text-slate-900 dark:text-white font-medium">{row['Vehicle']}</td>
          <td className="py-2 px-3">
            <span className={`px-2 py-1 rounded-full text-xs font-medium ${
              row['Status'] === 'Active' 
                ? 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200'
                : row['Status'] === 'Maintenance'
                ? 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200'
                : 'bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-200'
            }`}>
              {row['Status']}
            </span>
          </td>
          <td className="py-2 px-3">
            <div className="flex items-center space-x-2">
              <span className="text-slate-900 dark:text-white font-medium text-xs">{row['Uptime (%)']}</span>
              <div className="w-16 bg-slate-200 dark:bg-slate-600 rounded-full h-1.5">
                <div 
                  className="bg-secondary h-1.5 rounded-full" 
                  style={{ width: `${numericValue(row['Uptime (%)'])}%` }}
                ></div>
              </div>
            </div>
          </td>
          <td className="py-2 px-3 text-slate-900 dark:text-white text-xs">₹{numericValue(row['Maintenance Cost']).toLocaleString()}</td>
          <td className="py-2 px-3">
            <span className={`text-xs font-medium ${
              numericValue(row['Target vs Actual']) >= 0 ? 'text-green-600' : 'text-red-600'
            }`}>
              {numericValue(row['Target vs Actual']) >= 0 ? '✅' : '❌'} 
              {numericValue(row['Target vs Actual']) >= 0 ? '+' : ''}{row['Target vs Actual']}%
            </span>
          </td>
        </>
      );
    
    case 'afterSales':
      return (
        <>
          <td className="py-2 px-3 text-slate-900 dark:text-white font-medium text-xs">{row['Ticket ID']}</td>
          <td className="py-2 px-3">
            <span className={`px-2 py-1 rounded-full text-xs font-medium ${
              row['Status'] === 'Completed' 
                ? 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200'
                : row['Status'] === 'In Progress'
                ? 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200'
                : 'bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200'
            }`}>
              {row['Status']}
            </span>
          </td>
          <td className="py-2 px-3 text-slate-900 dark:text-white text-xs">{row['Resolution Time']}</td>
          <td className="py-2 px-3">
            <span className={`font-medium text-xs ${numericValue(row['Profit']) > 0 ? 'text-green-600' : 'text-gray-500'}`}>
              {numericValue(row['Profit']) > 0 ? `₹${numericValue(row['Profit']).toLocaleString()}` : '-'}
            </span>
          </td>
          <td className="py-2 px-3">
            <div className="flex items-center space-x-2">
              <span className="text-slate-900 dark:text-white font-medium text-xs">{row['SLA Compliance']}%</span>
              <div className="w-12 bg-slate-200 dark:bg-slate-600 rounded-full h-1.5">
                <div 
                  className={`h-1.5 rounded-full ${numericValue(row['SLA Compliance']) >= 90 ? 'bg-green-500' : numericValue(row['SLA Compliance']) >= 70 ? 'bg-yellow-500' : 'bg-red-500'}`}
                  style={{ width: `${numericValue(row['SLA Compliance'])}%` }}
                ></div>
              </div>
            </div>
          </td>
        </>
      );
    
    case 'sales':
      return (
        <>
          <td className="py-2 px-3">
            <div className="flex items-center space-x-2">
              <div className="flex-shrink-0 w-6 h-6 bg-secondary rounded-full flex items-center justify-center text-white text-xs font-medium">
                {stringValue(row['Sales Rep']).charAt(0)}
              </div>
              <span className="text-slate-900 dark:text-white font-medium text-xs truncate">{row['Sales Rep']}</span>
            </div>
          </td>
          <td className="py-2 px-3 text-slate-900 dark:text-white font-medium text-xs">{row['Deals Closed']}</td>
          <td className="py-2 px-3 text-slate-900 dark:text-white text-xs">₹{(numericValue(row['Revenue'])/100000).toFixed(1)}L</td>
          <td className="py-2 px-3">
            <span className={`flex items-center space-x-1 font-medium text-xs ${
              numericValue(row['MoM Growth']) >= 0 ? 'text-green-600' : 'text-red-600'
            }`}>
              <span>{numericValue(row['MoM Growth']) >= 0 ? '+' : ''}{row['MoM Growth']}%</span>
              {numericValue(row['MoM Growth']) >= 0 ? '↑' : '↓'}
            </span>
          </td>
          <td className="py-2 px-3">
            <div className="flex items-center space-x-2">
              <span className="text-slate-900 dark:text-white font-medium text-xs">{row['Target Achievement']}%</span>
              <div className="w-16 bg-slate-200 dark:bg-slate-600 rounded-full h-1.5">
                <div 
                  className={`h-1.5 rounded-full ${
                    numericValue(row['Target Achievement']) >= 100 ? 'bg-green-500' : numericValue(row['Target Achievement']) >= 80 ? 'bg-yellow-500' : 'bg-red-500'
                  }`}
                  style={{ width: `${Math.min(numericValue(row['Target Achievement']), 100)}%` }}
                ></div>
              </div>
              <span className="text-xs">
                {numericValue(row['Target Achievement']) >= 100 ? '🎯' : numericValue(row['Target Achievement']) >= 80 ? '📈' : '📉'}
              </span>
            </div>
          </td>
        </>
      );
    
    default:
      return null;
  }
};

export default DashboardTemplate;