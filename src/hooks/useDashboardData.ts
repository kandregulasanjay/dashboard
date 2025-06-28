import { useState, useEffect, useCallback, useMemo } from 'react';
import api, { FilterParams, KPIData, ChartData, TableData } from '@/services/api';

export interface DashboardData {
  kpis: KPIData[];
  charts: ChartData[];
  table: TableData;
}

export const useDashboardData = (
  dashboardType: 'fleet' | 'afterSales' | 'sales',
  filters: FilterParams
) => {
  const [data, setData] = useState<DashboardData>({
    kpis: [],
    charts: [],
    table: { headers: [], rows: [] }
  });
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Memoize filter params to prevent unnecessary re-renders
  const memoizedFilters = useMemo(() => {
    // Create a stable object reference for filters
    const baseFilters = { month: filters.month, year: filters.year };
    const additionalFilters = Object.keys(filters)
      .filter(key => !['month', 'year'].includes(key))
      .reduce((acc, key) => {
        acc[key] = filters[key];
        return acc;
      }, {} as { [key: string]: string | number });
    
    return { ...baseFilters, ...additionalFilters };
  }, [filters.month, filters.year, JSON.stringify(filters)]);

  const fetchData = useCallback(async () => {
    setIsLoading(true);
    setError(null);

    try {
      let kpis: KPIData[] = [];
      let charts: ChartData[] = [];
      let table: TableData = { headers: [], rows: [] };

      switch (dashboardType) {
        case 'fleet': {
          const [
            kpisData,
            utilizationChart,
            vehicleTypesChart,
            maintenanceChart,
            regionalChart,
            tableData
          ] = await Promise.all([
            api.fleet.getKPIs(memoizedFilters),
            api.fleet.getUtilizationChart(memoizedFilters),
            api.fleet.getVehicleTypesChart(memoizedFilters),
            api.fleet.getMaintenanceChart(memoizedFilters),
            api.fleet.getRegionalChart(memoizedFilters),
            api.fleet.getVehicleTable(memoizedFilters)
          ]);

          console.log('Fleet API Responses:', {
            kpisData,
            utilizationChart,
            vehicleTypesChart,
            maintenanceChart,
            regionalChart,
            filters: memoizedFilters
          });

          kpis = kpisData;
          charts = [
            utilizationChart?.data ? { ...utilizationChart } : { name: "Fleet Utilization Trend", chart_type: "line", data: [] },
            vehicleTypesChart?.data ? { ...vehicleTypesChart } : { name: "Vehicle Types Breakdown", chart_type: "pie", data: [] },
            maintenanceChart?.data ? { ...maintenanceChart } : { name: "Maintenance Costs vs Target", chart_type: "bar", data: [] },
            regionalChart?.data ? { ...regionalChart } : { name: "Regional Vehicle Activity", chart_type: "area", data: [] }
          ];
          table = tableData;
          break;
        }

        case 'afterSales': {
          const [
            kpisData,
            revenueChart,
            ticketStatusChart,
            costByVehicleChart,
            regionalDowntimeChart,
            tableData
          ] = await Promise.all([
            api.afterSales.getKPIs(memoizedFilters),
            api.afterSales.getRevenueChart(memoizedFilters),
            api.afterSales.getTicketStatusChart(memoizedFilters),
            api.afterSales.getCostByVehicleChart(memoizedFilters),
            api.afterSales.getRegionalDowntimeChart(memoizedFilters),
            api.afterSales.getTicketsTable(memoizedFilters)
          ]);

          console.log('AfterSales API Responses:', {
            kpisData,
            revenueChart,
            ticketStatusChart,
            costByVehicleChart,
            regionalDowntimeChart,
            filters: memoizedFilters
          });

          kpis = kpisData;
          charts = [
            revenueChart?.data ? { ...revenueChart } : { name: "Revenue Trend", chart_type: "line", data: [] },
            ticketStatusChart?.data ? { ...ticketStatusChart } : { name: "Ticket Status Distribution", chart_type: "pie", data: [] },
            costByVehicleChart?.data ? { ...costByVehicleChart } : { name: "Service Costs by Vehicle Type", chart_type: "bar", data: [] },
            regionalDowntimeChart?.data ? { ...regionalDowntimeChart } : { name: "Average Downtime by Region", chart_type: "area", data: [] }
          ];
          table = tableData;
          break;
        }

        case 'sales': {
          const [
            kpisData,
            salesGrowthChart,
            productSalesChart,
            regionSalesChart,
            conversionFunnelChart,
            tableData
          ] = await Promise.all([
            api.sales.getKPIs(memoizedFilters),
            api.sales.getSalesGrowthChart(memoizedFilters),
            api.sales.getProductSalesChart(memoizedFilters),
            api.sales.getRegionSalesChart(memoizedFilters),
            api.sales.getConversionFunnelChart(memoizedFilters),
            api.sales.getSalesRepTable(memoizedFilters)
          ]);

          console.log('Sales API Responses:', {
            kpisData,
            salesGrowthChart,
            productSalesChart,
            regionSalesChart,
            conversionFunnelChart,
            filters: memoizedFilters
          });

          kpis = kpisData;
          charts = [
            salesGrowthChart?.data ? { ...salesGrowthChart } : { name: "Sales Growth (YoY)", chart_type: "line", data: [] },
            productSalesChart?.data ? { ...productSalesChart } : { name: "Product-wise Sales Distribution", chart_type: "pie", data: [] },
            regionSalesChart?.data ? { ...regionSalesChart } : { name: "Sales by Region vs Target", chart_type: "bar", data: [] },
            conversionFunnelChart?.data ? { ...conversionFunnelChart } : { name: "Lead to Sales Funnel", chart_type: "area", data: [] }
          ];
          table = tableData;
          break;
        }
      }

      console.log('Final processed data:', { kpis, charts, table });
      setData({ kpis, charts, table });
    } catch (err) {
      console.error('Error fetching dashboard data:', err);
      setError(
        err instanceof Error 
          ? err.message 
          : 'Failed to fetch dashboard data. Please make sure the backend server is running.'
      );
    } finally {
      setIsLoading(false);
    }
  }, [dashboardType, memoizedFilters]);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  return { data, isLoading, error, refetch: fetchData };
};