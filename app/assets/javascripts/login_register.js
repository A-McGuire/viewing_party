document.addEventListener('DOMContentLoaded', () => {

  //buttons
  const registerButton = document.querySelector(".register-button")
  const loginButton = document.querySelector(".login-button")

  //forms
  const registerForm = document.querySelector(".register-form")
  const loginForm = document.querySelector(".login-form")

  loginButton.addEventListener('click', () => {
    registerForm.style.display = 'none'
    loginButton.style.display = 'none'
    registerButton.style.display = 'block'
    loginForm.style.display = 'block'
  })

  registerButton.addEventListener('click', () => {
    registerForm.style.display = 'block'
    loginButton.style.display = 'block'
    registerButton.style.display = 'none'
    loginForm.style.display = 'none'
  })
})
