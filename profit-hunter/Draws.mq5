input bool DrawingsOn            	 = true;    

input bool HighestLowest_Day_Drawings_on = false;
input bool Range_Drawings_on			 = false;
input bool Orders_Place_Drawings_on		 = false;

bool CURRENT_HighestLowest_Day_Drawings_on = DrawingsOn;

/*
STYLE_SOLID
Linha sólida
STYLE_DASH
Linha tracejada
STYLE_DOT
Linha pontilhada
STYLE_DASHDOT
Linha traço-ponto
STYLE_DASHDOTDOT
*/



void SetObjectLine(string objName, datetime x_A, double y_A, datetime x_B, double y_B, color objColor, int lineWidth,  ENUM_LINE_STYLE lineStyle)
{

	ObjectDelete(_Symbol, objName);
	DrawObjectTrendLine_evo(objName,
                            x_A,
                            y_A,
                            x_B,
                            y_B,
                            objColor,
                            lineWidth,
                            lineStyle
                            );

}









//+------------------------------------------------------------------+
//| DROWS                                                                  |
//+------------------------------------------------------------------+
void DrawPositonInfo(int labelNumber, string positionInfo, string positionValue, string xAxis, string yAxis)
{

    ObjectCreate(_Symbol, "Label" + labelNumber, OBJ_LABEL, 0, 0, 0);
    ObjectSetString(0, "Label" + labelNumber, OBJPROP_FONT, "Arial");
    ObjectSetInteger(0, "Label" + labelNumber, OBJPROP_FONTSIZE, "12");
    ObjectSetString(0, "Label" + labelNumber, OBJPROP_TEXT, positionInfo + " ->  " + positionValue);
    ObjectSetInteger(0, "Label" + labelNumber, OBJPROP_XDISTANCE, xAxis);
    ObjectSetInteger(0, "Label" + labelNumber, OBJPROP_YDISTANCE, yAxis);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DrawHorizontalLine(string objName, double level, color cr)
{

   ObjectCreate(_Symbol, "Line" + objName, OBJ_HLINE, 0, 0, level);

    ObjectSetInteger(0, "Line" + objName, OBJPROP_COLOR, cr);

    
    ObjectSetInteger(0, "Line" + objName, OBJPROP_WIDTH, 3);
    ObjectMove(_Symbol, "Line" + objName, 0, 0, level);

}

void DrawHorizontalLine_Evo(string objName, double level, color objColor, int objWidth, ENUM_LINE_STYLE style)
{

   ObjectCreate(_Symbol, "Line" + objName, OBJ_HLINE, 0, 0, level);
   ObjectSetInteger(_Symbol ,"Line" + objName, OBJPROP_STYLE, style);
   ObjectSetInteger(0, "Line" + objName, OBJPROP_COLOR, objColor);
   ObjectSetInteger(0, "Line" + objName, OBJPROP_WIDTH, objWidth);
   ObjectMove(_Symbol, "Line" + objName, 0, 0, level);

}




void DrawObject(int objNumber, double price, string sr)
{

   ObjectCreate(_Symbol, "Line" + objNumber, OBJ_HLINE, 0, 0, price);
   if(sr == "R")
   {
    ObjectSetInteger(0, "Line" + objNumber, OBJPROP_COLOR, clrRed);
   }
   else
   {
      ObjectSetInteger(0, "Line" + objNumber, OBJPROP_COLOR, clrAliceBlue);
   }
    
    ObjectSetInteger(0, "Line" + objNumber, OBJPROP_WIDTH, 3);
    ObjectMove(_Symbol, "Line" + objNumber, 0, 0, price);
	
	
	
	
	
	
	
    /*
   bool  ObjectMove(
   long      chart_id,        // identificador gráfico
   string    name,            // nome objeto
   int       point_index,     // número ponto ancoragem
   datetime  time,            // Tempo
   double    price            // Preço
   );
   */
}
void DrawObjectTrendLine_Evo(int objNumber, string objName, datetime time_A, double level_A, datetime time_B, double level_B, color objColor)
{

	ObjectCreate
	(
		_Symbol,
		objName,
		OBJ_TREND,
		0,
		time_A,
		level_A,
		time_B,
		level_B
	);
   ObjectSetInteger(0, objName, OBJPROP_COLOR, objColor);
	//ObjectSetInteger(0, objName, OBJPROP_XSIZE, 300);
	//ObjectSetInteger(0, objName, OBJPROP_YSIZE, 300);
	ObjectSetInteger(0, objName, OBJPROP_WIDTH, 3);
	ObjectMove(_Symbol, objName, 1, time_B, level_B);
}


void DrawObjectTrendLine(int objNumber, string sr, datetime time_A, double level_A, datetime time_B, double level_B )
{

	ObjectCreate
	(
		_Symbol,
		sr + objNumber,
		OBJ_TREND,
		0,
		time_A,
		level_A,
		time_B,
		level_B
	);
   ObjectSetInteger(0, sr+ objNumber, OBJPROP_COLOR, clrAliceBlue);
	//ObjectSetInteger(0, "trend" + objNumber, OBJPROP_XSIZE, 300);
	//ObjectSetInteger(0, "trend" + objNumber, OBJPROP_YSIZE, 300);
	ObjectSetInteger(0, sr+objNumber, OBJPROP_WIDTH, 3);
	ObjectMove(_Symbol, sr+objNumber, 1, time_B, level_B);
}


void DrawObjectTrendLine_evo(string objName, datetime time_A, double level_A, datetime time_B, double level_B, color objColor, int lineWidth,  ENUM_LINE_STYLE lineStyle)
{

	ObjectCreate
	(
		_Symbol,
		objName,
		OBJ_TREND,
		0,
		time_A,
		level_A,
		time_B,
		level_B
	);
   ObjectSetInteger(0, objName, OBJPROP_COLOR, objColor);
	//ObjectSetInteger(0, "trend" + objNumber, OBJPROP_XSIZE, 300);
	//ObjectSetInteger(0, "trend" + objNumber, OBJPROP_YSIZE, 300);
   ObjectSetInteger(_Symbol, objName, OBJPROP_STYLE, lineStyle);
	ObjectSetInteger(0, objName, OBJPROP_WIDTH, lineWidth);
	ObjectMove(_Symbol, objName, 1, time_B, level_B);
}



void DrawObjectRectangle(string sr, datetime time_A, double level_A, datetime time_B, double level_B, color cor)
{
	
	ObjectCreate
	(
		_Symbol,
		sr,
		OBJ_RECTANGLE,
		0,
		time_A,
		level_A,
		time_B,
		level_B
	);
	
	//ObjectSetInteger(0, sr+objNumber , OBJPROP_COLOR, clrRed);
	//ObjectSetInteger(0, sr+objNumber , OBJPROP_FILL, clrRed);
	ObjectSetInteger(0, sr , OBJPROP_COLOR, cor);
	ObjectSetInteger(0, sr , OBJPROP_FILL, cor);
	
}

void DrawObjectLine(string ObjName, datetime time_A, double level_A, datetime time_B, double level_B, color objColor)
{
	
	ObjectCreate
	(
		_Symbol,
		ObjName,
		OBJ_TREND,
		0,
		time_A,
		level_A,
		time_B,
		level_B
	);
	

	ObjectSetInteger(0, ObjName , OBJPROP_COLOR, objColor);
	ObjectSetInteger(0, ObjName, OBJPROP_WIDTH, 2);
	ObjectSetString(0, ObjName, OBJPROP_LEVELTEXT, DoubleToString(level_A));
	//ObjectSetInteger(0, ObjName , OBJPROP_FILL, objColor);
	
}

void DrawObjectFIBO(string sr, datetime time_A, double level_A, datetime time_B, double level_B, color cor )
{

	ObjectCreate
	(
		_Symbol,
		sr,
		OBJ_FIBO,
		0,
		time_A,
		level_A,
		time_B,
		level_B
	);
	ObjectSetInteger(0, sr , OBJPROP_COLOR, cor);
	ObjectSetInteger(0, sr, OBJPROP_WIDTH, 2);
	ObjectSetString(0,sr,OBJPROP_LEVELTEXT, DoubleToString(level_A));
	//ObjectSetInteger(0, sr , OBJPROP_FILL, cor);
}


//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
/*
int start()
  {
   string obj_name="trend_line";
   long current_chart_id=ChartID();
//---
   datetime t1=Time[0];
   double p1=Close[0];
//---
   datetime t2=Time[1];
   double p2=Close[1];
//--- creating trend line object
   if(!ObjectCreate(obj_name,OBJ_TREND,0,t1,p1,t2,p2))
     {
      Print("Error: can't create trend line! code #",GetLastError());
      return(0);
     }
//--- set color to Red
   ObjectSetInteger(current_chart_id,obj_name,OBJPROP_COLOR,clrRed);
//--- moving of the trend line
   for(int i=1; i<200; i++)
     {     
      t2=Time[i];
      p2=Close[i];
      //--- move the 2nd anchor point of the trend line
      ObjectMove(obj_name,1,t2,p2);
      //--- forced chart redraw
      ChartRedraw(current_chart_id);
      Sleep(100);
     }
//--- sleep to see the object
   Sleep(3000);
//--- delete object
   ObjectDelete(obj_name);
   return(0);
  }
*/


//+------------------------------------------------------------------+
/*
bool  ObjectCreate(
   long         chart_id,      // identificador gráfico
   string       name,          // nome objeto
   ENUM_OBJECT  type,          // tipo objeto
   sub_window   nwin,          // índice janela
   datetime     time1,         // tempo do primeiro ponto de ancoragem
   double       price1,        // preço do primeiro ponto de ancoragem
   ...
   datetime     timeN=0,       // tempo de N ponto de ancoragem
   double       priceN=0,      // preço de N ponto de ancoragem
   ...
   datetime     time30=0,      // tempo do trigésimo ponto de ancoragem
   double       price30=0      // preço do trigésimo ponto de ancoragem
   );
   
   */

void CheckDrawingOn()
{
	if(!CURRENT_HighestLowest_Day_Drawings_on)
	{
		CURRENT_HighestLowest_Day_Drawings_on = false;
		ResetAllDrawings();
	}
}

void ResetAllDrawings()
{
	DeletAllDrawings_Tech_Range();
	DeletAllDrawings_Orders_Place();
}

void DeletAllDrawings_Tech_Range()
{
	
	ObjectDelete(_Symbol, "LAST_LEFT_BAR_HIGHESTHIGH_MAX");
	ObjectDelete(_Symbol, "LAST_LEFT_BAR_LOWESTLOW_MIN");
	ObjectDelete(_Symbol, "LEFT_BAR_LEVEL_MID");

	//---
	
	ObjectDelete(_Symbol, "LineSMALLER_DAY_LOW");
	ObjectDelete(_Symbol, "LineBIGGEST_DAY_HIGH");
	ObjectDelete(_Symbol, "LineMID_DAY_LEVEL");

	ObjectDelete(_Symbol, "LineLAST_SMALLER_DAY_LOW");
	ObjectDelete(_Symbol, "LineLAST_BIGGEST_DAY_HIGH");
	ObjectDelete(_Symbol, "LineLAST_MID_DAY_LEVEL");

	ObjectDelete(_Symbol, "LineQUARTER_TOP_DAY_LEVEL");
	ObjectDelete(_Symbol, "LineQUARTER_BOTTOM_DAY_LEVEL");
	
	//---

/*
	ObjectDelete(_Symbol, "rdt_T027");
	ObjectDelete(_Symbol, "rdt_T061");
	ObjectDelete(_Symbol, "rdt_T161");
	ObjectDelete(_Symbol, "rdt_T100");
	ObjectDelete(_Symbol, "rdt_T161");
	
	ObjectDelete(_Symbol, "rdt_CURRENT_0");
	ObjectDelete(_Symbol, "rdt_CURRENT_1");
	ObjectDelete(_Symbol, "rdt_R61");
	ObjectDelete(_Symbol, "rdt_R50");
	ObjectDelete(_Symbol, "rdt_R38");



	ObjectDelete(_Symbol, "DTrdt_T161");
	ObjectDelete(_Symbol, "DTrdt_T100");
	ObjectDelete(_Symbol, "DTrdt_T061");
	ObjectDelete(_Symbol, "DTrdt_T027");

	ObjectDelete(_Symbol, "DTrdt_R61");
	ObjectDelete(_Symbol, "DTrdt_R50");
	ObjectDelete(_Symbol, "DTrdt_R38");

	ObjectDelete(_Symbol, "rdt_CURRENT_WAVE_A");
	ObjectDelete(_Symbol, "rdt_CURRENT_WAVE_2");
*/
	//---

	ObjectDelete(_Symbol, "SMALLER_DAY_LOW");
	ObjectDelete(_Symbol, "BIGGEST_DAY_HIGH");
	ObjectDelete(_Symbol, "MID_DAY_LEVEL");


	ObjectDelete(_Symbol, "QUARTER_TOP_DAY_LEVEL");
	ObjectDelete(_Symbol, "QUARTER_BOTTOM_DAY_LEVEL");

}


void DeletAllDrawings_Orders_Place()
{
	ObjectDelete(_Symbol, "FINAL_EN_LONG_VALUE");
	ObjectDelete(_Symbol, "FINAL_EN_SHORT_VALUE");
	ObjectDelete(_Symbol, "FINAL_TP_LONG_VALUE");
	ObjectDelete(_Symbol, "FINAL_TP_SHORT_VALUE");
	ObjectDelete(_Symbol, "FINAL_SL_LONG_VALUE");
	ObjectDelete(_Symbol, "FINAL_SL_SHORT_VALUE");
	
	
	ObjectDelete(_Symbol, "EN_BUY_MARKET_LEVEL");
	ObjectDelete(_Symbol, "EN_SELL_MARKET_LEVEL");

	ObjectDelete(_Symbol, "EN_BUY_a");
	ObjectDelete(_Symbol, "EN_BUY_b");
	ObjectDelete(_Symbol, "EN_BUY_c");

	ObjectDelete(_Symbol, "EN_SELL_a");
	ObjectDelete(_Symbol, "EN_SELL_b");
	ObjectDelete(_Symbol, "EN_SELL_c");

}




void MarketOrder_Drawings_Dev()
{
	int extend_line = 100;
	int left_line = 5;

    //DeletAllDrawings_Tech_Range();

	//--- compra
    SetObjectLine("EN_BUY_MARKET_LEVEL",
                    PriceInfo[left_line].time,
					Level_Buy,
					(PriceInfo[0].time)+(extend_line),
					Level_Buy,
                    clrDarkTurquoise,
                    1,
                    STYLE_SOLID//STYLE_DOT                    
                    );  	



    SetObjectLine("EN_SELL_MARKET_LEVEL",
                    PriceInfo[left_line].time,
					Level_Sell,
					(PriceInfo[0].time)+(extend_line),
					Level_Sell,
                    clrRed,
                    1,
                    //STYLE_DOT//STYLE_DOT    
                    STYLE_SOLID//STYLE_DOT                  
                    ); 

}


void MarketOrder_Buy_Drawings_Dev()
{
	int extend_line = 100;
	int left_line = 5;

	datetime init_y_A = PriceInfo[left_line].time;
	datetime end_y_A = (PriceInfo[0].time)+(extend_line);
	double init_x_A = Level_Buy;
	double end_x_A = Level_Buy;

	//--- compra
    SetObjectLine("EN_BUY_a",
                    init_y_A,
					init_x_A,
					end_y_A,
					end_x_A,
                    clrDarkTurquoise,
                    1,
                    STYLE_SOLID//STYLE_DOT                    
                    );  	

    SetObjectLine("EN_BUY_b",
                    end_y_A,
					Level_Buy,
					(PriceInfo[0].time)+(extend_line+30),
					Level_Buy-50,
                    clrDarkTurquoise,
                    1,
                    STYLE_SOLID//STYLE_DOT                    
                    );  	

    SetObjectLine("EN_BUY_c",
                    (PriceInfo[0].time)+(extend_line+30),
					Level_Buy-50,
					(PriceInfo[0].time)+(extend_line+120),
					Level_Buy-50,
                    clrDarkTurquoise,
                    1,
                    STYLE_SOLID//STYLE_DOT                    
                    );  
}

void MarketOrder_Sell_Drawings_Dev()
{
	int extend_line = 100;
	int left_line = 5;

	datetime init_y_A = PriceInfo[left_line].time;
	datetime end_y_A = (PriceInfo[0].time)+(extend_line);
	double init_x_A = Level_Sell;
	double end_x_A = Level_Sell;

	//--- compra
    SetObjectLine("EN_SELL_a",
                    init_y_A,
					init_x_A,
					end_y_A,
					end_x_A,
                    clrRed,
                    1,
                    STYLE_SOLID//STYLE_DOT                    
                    );  	

    SetObjectLine("EN_SELL_b",
                    end_y_A,
					Level_Sell,
					(PriceInfo[0].time)+(extend_line+30),
					Level_Sell+50,
                    clrRed,
                    1,
                    STYLE_SOLID//STYLE_DOT                    
                    );  	

    SetObjectLine("EN_SELL_c",
                    (PriceInfo[0].time)+(extend_line+30),
					Level_Sell+50,
					(PriceInfo[0].time)+(extend_line+120),
					Level_Sell+50,
                    clrRed,
                    1,
                    STYLE_SOLID//STYLE_DOT                    
                    );  
}