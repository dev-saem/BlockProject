function time(){
    var currentDate = new Date();
    let span = window.document.body.querySelector(':scope > span');
    span.innerHTML=currentDate.getHours()+"시"+currentDate.getMinutes()+"분"+currentDate.getSeconds()+"초";
    setInterval("time()",1000);
}
time();
