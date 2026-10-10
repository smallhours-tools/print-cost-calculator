export interface CostInputs {
  weightG: number;
  printTimeHours: number;
  /** Price per kg of filament. */
  filamentPricePerKg: number;
  /** Extra % of material lost to purges/supports/failures. */
  wastePct: number;
  printerPowerW: number;
  electricityPerKwh: number;
  /** Printer purchase price spread over its lifetime hours. */
  printerCost: number;
  printerLifetimeHours: number;
  /** Maintenance/wear cost per print hour. */
  maintenancePerHour: number;
  laborMinutes: number;
  laborPerHour: number;
  /** Desired profit margin as % of the final price (0-90). */
  marginPct: number;
  /** Marketplace percentage fee on price (0-50). */
  feePct: number;
  /** Fixed fee per order. */
  feeFixed: number;
}

export interface CostBreakdown {
  material: number;
  electricity: number;
  wear: number;
  labor: number;
  subtotal: number;
  suggestedPrice: number;
  fees: number;
  profit: number;
}

const nn = (n: number) => (Number.isFinite(n) && n > 0 ? n : 0);

export function computeCost(i: CostInputs): CostBreakdown {
  const material = (nn(i.weightG) / 1000) * nn(i.filamentPricePerKg) * (1 + nn(i.wastePct) / 100);
  const hours = nn(i.printTimeHours);
  const electricity = (nn(i.printerPowerW) / 1000) * hours * nn(i.electricityPerKwh);
  const depreciation = nn(i.printerLifetimeHours) > 0 ? (nn(i.printerCost) / i.printerLifetimeHours) * hours : 0;
  const wear = depreciation + nn(i.maintenancePerHour) * hours;
  const labor = (nn(i.laborMinutes) / 60) * nn(i.laborPerHour);
  const subtotal = material + electricity + wear + labor;
  const margin = Math.min(nn(i.marginPct), 90) / 100;
  const feePct = Math.min(nn(i.feePct), 50) / 100;
  // price*(1 - feePct - margin) = subtotal + feeFixed
  const denom = 1 - feePct - margin;
  const suggestedPrice = denom > 0.01 ? (subtotal + nn(i.feeFixed)) / denom : 0;
  const fees = suggestedPrice * feePct + (suggestedPrice > 0 ? nn(i.feeFixed) : 0);
  const profit = suggestedPrice - subtotal - fees;
  return { material, electricity, wear, labor, subtotal, suggestedPrice, fees, profit };
}

// printerPowerW: typical average while printing PLA (Prusa knowledge base, Bambu Lab wiki).
export const DEFAULTS: CostInputs = {
  weightG: 0, printTimeHours: 0, filamentPricePerKg: 20, wastePct: 5,
  printerPowerW: 100, electricityPerKwh: 0.15, printerCost: 400, printerLifetimeHours: 4000,
  maintenancePerHour: 0.05, laborMinutes: 10, laborPerHour: 15, marginPct: 30, feePct: 6.5, feeFixed: 0.25,
};
