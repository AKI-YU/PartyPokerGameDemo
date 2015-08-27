# 情境說明

「Party Game」的定義是多人使用一個手機進行的遊戲，此範例以心臟病為例，以簡單的[self performSelector:withObject:afterDelay:]; 來銜接每一回合的操作，避免NSTimer可能會造成時間執行上的落差。


## 遊戲說明
四個玩家依序將手上的牌一張張的放入中間的牌堆中，當牌的數字與順序的數字相符時，則四個玩家分別搶按自己的按鈕，最後按的玩家，則為輸家，將牌拿回自己的牌堆之中，再由1，2，3的順序重新開始。若順序與牌面的字不符時，有玩家錯按，仍為輸家，必須將牌拿回自己的牌堆之中，再由1，2，3的順序重新開始。遊戲一直進行，直到某一個玩家手中的牌堆為0，且最後一次的搶答不為輸家，則為此次遊戲的獲勝者。


雛型截圖

![](https://raw.githubusercontent.com/nobodyyu/GraphicsBed/master/poker01.png =320x568)

![](https://raw.githubusercontent.com/nobodyyu/GraphicsBed/master/poker02.png =320x568)


<br><br>

# 未完項目
<br>
## 順序數可以用聲音檔取代
<br>
## UI優化
<br>
#### 換圖
<br>
#### 判定勝負後，牌堆過場給輸家的動畫
<br>
#### 玩家按鈕點擊時特效或音效

