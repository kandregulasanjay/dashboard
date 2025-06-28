import { Calendar, X, Filter } from 'lucide-react';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Button } from '@/components/ui/button';

export interface FilterState {
  month: number;
  year: number;
  [key: string]: string | number; // Allow additional filter parameters for cross-filtering
}

interface DashboardFiltersProps {
  filters: FilterState;
  onFiltersChange: (filters: FilterState) => void;
  isLoading?: boolean;
  crossFilter?: { [key: string]: string | number } | null;
  onClearCrossFilter?: () => void;
  dashboardType?: 'fleet' | 'afterSales' | 'sales';
}

const DashboardFilters = ({ 
  filters, 
  onFiltersChange, 
  isLoading, 
  crossFilter, 
  onClearCrossFilter,
  dashboardType 
}: DashboardFiltersProps) => {
  const months = [
    { value: 1, label: 'January' },
    { value: 2, label: 'February' },
    { value: 3, label: 'March' },
    { value: 4, label: 'April' },
    { value: 5, label: 'May' },
    { value: 6, label: 'June' },
    { value: 7, label: 'July' },
    { value: 8, label: 'August' },
    { value: 9, label: 'September' },
    { value: 10, label: 'October' },
    { value: 11, label: 'November' },
    { value: 12, label: 'December' }
  ];

  const currentYear = new Date().getFullYear();
  const years = Array.from({ length: 10 }, (_, i) => currentYear - 5 + i);

  const handleMonthChange = (month: string) => {
    onFiltersChange({
      ...filters,
      month: parseInt(month)
    });
  };

  const handleYearChange = (year: string) => {
    onFiltersChange({
      ...filters,
      year: parseInt(year)
    });
  };

  const getFilterDisplayName = (key: string, value: string | number) => {
    const displayNames: { [key: string]: { [key: string]: string } } = {
      fleet: {
        vehicle_id: 'Vehicle',
        status: 'Status',
        region: 'Region'
      },
      afterSales: {
        month: 'Month',
        status: 'Status',
        vehicle_type: 'Vehicle Type',
        region: 'Region'
      },
      sales: {
        month: 'Month',
        product: 'Product',
        region: 'Region',
        stage: 'Stage'
      }
    };

    const displayName = displayNames[dashboardType || 'fleet']?.[key] || key;
    return `${displayName}: ${value}`;
  };

  return (
    <div className="bg-white dark:bg-slate-800 rounded-lg p-3 shadow-sm border border-slate-200 dark:border-slate-700">
      <div className="flex flex-col gap-3">
        {/* Header with Filters Title */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Calendar className="h-4 w-4 text-slate-600 dark:text-slate-300" />
            <h2 className="text-sm font-semibold text-slate-900 dark:text-white">Filters</h2>
          </div>
        </div>

        {/* Filter Controls */}
        <div className="flex flex-col sm:flex-row gap-3 items-start sm:items-end justify-between">
          <div className="flex flex-col sm:flex-row gap-3 w-full sm:w-auto">
            {/* Month Filter */}
            <div className="space-y-1">
              <label className="text-xs font-medium text-slate-700 dark:text-slate-300">Month</label>
              <Select value={filters.month.toString()} onValueChange={handleMonthChange} disabled={isLoading}>
                <SelectTrigger className="w-full sm:w-[120px] h-8 text-xs bg-white dark:bg-slate-800 border-slate-200 dark:border-slate-700">
                  <SelectValue placeholder="Select month" />
                </SelectTrigger>
                <SelectContent className="bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 z-50">
                  {months.map((month) => (
                    <SelectItem key={month.value} value={month.value.toString()} className="hover:bg-slate-100 dark:hover:bg-slate-700 text-xs">
                      {month.label}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>

            {/* Year Filter */}
            <div className="space-y-1">
              <label className="text-xs font-medium text-slate-700 dark:text-slate-300">Year</label>
              <Select value={filters.year.toString()} onValueChange={handleYearChange} disabled={isLoading}>
                <SelectTrigger className="w-full sm:w-[80px] h-8 text-xs bg-white dark:bg-slate-800 border-slate-200 dark:border-slate-700">
                  <SelectValue placeholder="Select year" />
                </SelectTrigger>
                <SelectContent className="bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 z-50">
                  {years.map((year) => (
                    <SelectItem key={year} value={year.toString()} className="hover:bg-slate-100 dark:hover:bg-slate-700 text-xs">
                      {year}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          </div>

          {/* Active Cross Filters Display */}
          {crossFilter && Object.keys(crossFilter).length > 0 && (
            <div className="flex items-center gap-2 bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-800 rounded-lg px-3 py-2">
              <Filter className="h-3 w-3 text-blue-600 dark:text-blue-400 flex-shrink-0" />
              <div className="flex flex-wrap gap-1">
                {Object.entries(crossFilter).map(([key, value]) => (
                  <span
                    key={key}
                    className="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-blue-100 text-blue-800 dark:bg-blue-800 dark:text-blue-200"
                  >
                    {getFilterDisplayName(key, value)}
                  </span>
                ))}
              </div>
              {onClearCrossFilter && (
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={onClearCrossFilter}
                  className="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-200 h-6 px-2 ml-1 flex-shrink-0"
                >
                  <X className="h-3 w-3 mr-1" />
                  <span className="text-xs">Clear</span>
                </Button>
              )}
            </div>
          )}
        </div>

        {/* Helper Text */}
        {crossFilter && Object.keys(crossFilter).length > 0 && (
          <p className="text-xs text-blue-600 dark:text-blue-400">
            Click on chart elements to filter data, or use "Clear" to show all.
          </p>
        )}
      </div>
    </div>
  );
};

export default DashboardFilters;