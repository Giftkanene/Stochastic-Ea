#property copyright "Algo Traders LTD"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//| include files                                                    |
//+------------------------------------------------------------------+

#include <Trade\Trade.mqh>


//+------------------------------------------------------------------+
//| Input variables                                                  |
//+------------------------------------------------------------------+

input int    InpKPeriod       = 5;       // %K period
input int    InpDPeriod       = 3;       // %D period
input int    InpSlowing       = 3;       // Slowing
input double InpLots          = 0.01;    // Lot size
input int    InpStopLossPips  = 200;     // Stop loss (pips)
input int    InpTakeProfitPips= 400;     // Take profit (pips)
input ulong  InpMagic         = 123456;  // Magic number
input string InpComment       = "StochEA";


//+------------------------------------------------------------------+
//| Global variables                                                  |
//+------------------------------------------------------------------+

CTrade trade;
int    stochHandle = INVALID_HANDLE;
double kBuf[3];
double dBuf[3];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // create Stochastic handle
   stochHandle = iStochastic(Symbol(), (ENUM_TIMEFRAMES)Period(), InpKPeriod, InpDPeriod, InpSlowing, (ENUM_MA_METHOD)MODE_SMA, (ENUM_STO_PRICE)STO_LOWHIGH);
   if(stochHandle == INVALID_HANDLE)
     {
      Print("Failed to create Stochastic handle");
      return(INIT_FAILED);
     }

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(stochHandle != INVALID_HANDLE)
     {
      IndicatorRelease(stochHandle);
      stochHandle = INVALID_HANDLE;
     }
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   
  }