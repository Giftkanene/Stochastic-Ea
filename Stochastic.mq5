#property copyright "Algo Traders LTD"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//| include files                                                    |
//+------------------------------------------------------------------+

#include <Trade\Trade.mqh>
#include <Indicators\Oscilators.mqh> 


//+------------------------------------------------------------------+
//| Input variables                                                  |
//+------------------------------------------------------------------+
input ulong            InpMagic               = 105;       // Magic number
input int              InpKPeriod             = 5;       // %K period
input int              InpDPeriod             = 3;       // %D period
input int              InpSlowing             = 3;       // Slowing
input double           InpLots                = 0.01;    // Lot size
input int              InpStopLossPips        = 200;     // Stop loss (pips)
input int              InpTakeProfitPips      = 400;     // Take profit (pips)
input ENUM_MA_METHOD   InpMaMethod            = MODE_SMA;      // MODE_SMA, MODE_EMA, MODE_SMMA, MODE_LWMA
input ENUM_STO_PRICE   InpPriceField          = STO_LOWHIGH;   // STO_LOWHIGH, STO_CLOSECLOSE
input string           InpComment             = "StochEA";


//+------------------------------------------------------------------+
//| Global variables                                                 |
//+------------------------------------------------------------------+

CTrade trade;                 // Object of CTrade Class 
CiStochastic stochastic;      // Object of CIndicator Class 

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
    if(!stochastic.Create(_Symbol,PERIOD_CURRENT,InpKPeriod,InpDPeriod,InpSlowing,InpMaMethod,InpPriceField))
    {
      Print("Failed to create Stochastic indicator");
      return(INIT_FAILED);
    }
    return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
  
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
    // lets print the indicator values on the chart 
    double mainValue =   stochastic.Main(0); // gets the main value of the indicator from the previous bar 
    double signalValue = stochastic.Signal(0); // get the signal value of the indicator from the previous bar
   
    
    // Comment("MAIN   = ", DoubleToString(mainValue,4), "\nSIGNAL = ", DoubleToString(signalValue,4));
     Print("the value of this indicator is  ", mainValue);
  
  }

