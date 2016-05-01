//Draging unit AcinPknlMwlkSrasWrflDb
//carrying without gun AcinPercMrunSnonWnonDf
//being carried AinjPfalMstpSnonWrflDf_carried
//dropped from carry AinjPfalMstpSnonWrflDf_carried_fall
//dragged AinjPpneMstpSnonWrflDb

b attachto [a,[0.3,1.1,0]];
b switchmove "AinjPpneMstpSnonWrflDb";
b setdir (direction a + 330);
a playmovenow "AcinPknlMwlkSrasWrflDb";
a disableCollisionWith b;