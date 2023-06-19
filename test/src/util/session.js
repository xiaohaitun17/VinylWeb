exports.getSession = (key) => {
    return JSON.parse(window.sessionStorage.getItem(key))
  }
  
  exports.setSession = (key, data) => {
    window.sessionStorage.setItem(key, JSON.stringify(data))
  }
  
  exports.removeSession = (key) => {
    window.sessionStorage.removeItem(key)
  }