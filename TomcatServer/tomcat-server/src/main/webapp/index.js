var isSignup = false;

function handleLogin() {
  console.log("Login");
}

function handleSignup() {
  console.log("Signup");
}

function toggleSignUp(event) {
  event.preventDefault();
  isSignup = !isSignup;
  const fullname = document.getElementById("addinfos");
  fullname.style.display = isSignup ? "flex" : "none";

  const actionbutton = document.getElementById("actionbutton");
  actionbutton.innerHTML = isSignup ? "Sign Up" : "Log In";
  actionbutton.onclick = isSignup ? handleSignup : handleLogin;

  const title = document.getElementById("title");
  title.innerHTML = isSignup ? "Sign Up" : "Log In";

  const toggler = document.getElementById("toggler");
  toggler.innerHTML = isSignup
    ? `<p id="toggler">You already have an account? <a href="" onclick="toggleSignUp(event)">Log In</a></p>`
    : `<p id="toggler">You don't have an account? <a href="" onclick="toggleSignUp(event)">Sign Up</a></p>`;
}
