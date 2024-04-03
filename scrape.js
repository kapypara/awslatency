// go to this site https://www.cloudping.info/
// run this script in the browser console

(function() {

  const hostname = (data) => {
    let a = document.createElement('a')
    a.href = data
    return a.hostname
  }

  let t = document.getElementsByTagName('table')[0]

  let output = ''
  Array.from(t.getElementsByTagName('tr')).map(x => {

    it = x.getElementsByTagName('td')

    if (it.length <= 1)
      return

    let name = it[0].innerHTML
    let link = hostname(it[1].getAttribute('pingurl'))

    output += '#. ' + link + '\t' + name + '\n'
    //console.log('#. ' + link + '\t' + name)
  })

  console.log(output)

})()
