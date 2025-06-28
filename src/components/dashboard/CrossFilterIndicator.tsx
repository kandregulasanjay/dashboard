import { X, Filter } from 'lucide-react';
import { Button } from '@/components/ui/button';

interface CrossFilterIndicatorProps {
  filter: { [key: string]: string | number };
  onClear: () => void;
  dashboardType: 'fleet' | 'afterSales' | 'sales';
}

const CrossFilterIndicator = ({ filter, onClear, dashboardType }: CrossFilterIndicatorProps) => {
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

    const displayName = displayNames[dashboardType]?.[key] || key;
    return `${displayName}: ${value}`;
  };

  return (
    <div className="bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-800 rounded-xl p-4">
      <div className="flex items-center justify-between">
        <div className="flex items-center space-x-3">
          <Filter className="h-5 w-5 text-blue-600 dark:text-blue-400" />
          <div>
            <h3 className="text-sm font-semibold text-blue-800 dark:text-blue-200">
              Active Filter
            </h3>
            <div className="flex flex-wrap gap-2 mt-1">
              {Object.entries(filter).map(([key, value]) => (
                <span
                  key={key}
                  className="inline-flex items-center px-2 py-1 rounded-md text-xs font-medium bg-blue-100 text-blue-800 dark:bg-blue-800 dark:text-blue-200"
                >
                  {getFilterDisplayName(key, value)}
                </span>
              ))}
            </div>
          </div>
        </div>
        <Button
          variant="ghost"
          size="sm"
          onClick={onClear}
          className="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-200"
        >
          <X className="h-4 w-4 mr-1" />
          Clear Filter
        </Button>
      </div>
      <p className="text-xs text-blue-600 dark:text-blue-400 mt-2">
        Click on any chart element to filter the dashboard, or click "Clear Filter" to show all data.
      </p>
    </div>
  );
};

export default CrossFilterIndicator;