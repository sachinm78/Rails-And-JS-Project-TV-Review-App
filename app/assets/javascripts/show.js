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
        let firstShow = new Show(data[0])
        let myShowHTML = firstShow.showHTML()
        document.getElementById('new-posts').innerHTML += myShowHTML
    })
}

class Show {
    cunstructor (obj){
        this.id = obj.id
        this.user_id = obj.user_id
        this.title = obj.title
        this.genre = obj.genre
    }
}

Show.prototype.showHTML = function(){
    return(`
        <div>
            <h3>${this.title}</h3>
            <p>${this.genre}</p>
        </div>
    `)
}