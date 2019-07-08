$(function(){
    getShow()
})

function getShow(){
    $.ajax({
        url:'http://localhost:3000/shows',
        method: 'get',
        dataType: 'json',
    }).done(function (data){
        console.log(data)
    })
}