<svelte:head>
	<title>Shorty</title>
</svelte:head>

<script lang="ts">
	import Navbar from "../lib/navbar.svelte";
	import Snackbar from "../lib/snackbar.svelte";
	import Overlay from "../lib/overlay.svelte";

	let snackbar;
	let snackbarText: string;
	let snackbarColor: string;
	let inputValue: string = '';

	// This function is being executed, if you
	// type something in the input. It checks,
	// if you pressed enter. Then the string will
	// be checked and the shorted url is being generated.
	function onSubmit(e: KeyboardEvent) {
		if (e.key === "Enter") {
			if (!validateUrl(inputValue)) {
				showSnackbar("Invalid url", "red");
			} else {
				addRedirect();
			}
		}
	}

	// This function shows the snackbar and
	// inserts the required texts and colors
	// for it, to get it to work
	function showSnackbar(text, color) {
		snackbarText = text;
		snackbarColor = color;
		snackbar.showMessage();
	}

	// This function validates, weather the given url is a real
	// url, or only an random string.
	// It makes sure, that only valid url strings can be used .
	function validateUrl(url: string): boolean {
		return (url.includes("http://") || url.includes("https://")) &&
			url.includes(".");
	}

	// This function tries to create a new short
	// url. If the action was successful, the server
	// returns HTTP OK and the url is shown in the
	// overlay
	async function addRedirect() {
		let origin = process.env.NODE_ENV === "development" ? "http://localhost:8080/api" : "/api"
		let data = await (await fetch(`${origin}/addRedirect`, {
			mode: process.env.NODE_ENV === "development" ? "cors" : "same-origin",
			method: "POST",
			headers: {
				Accept: "application/json",
				"Content-Type": "application/json"
			},
			body: JSON.stringify({url: "https://pornhub.com"})
		})).json();
	}

</script>


<div>
	<Navbar />
	<div class='container'>
		<input type='text' on:keydown={e => onSubmit(e)} bind:value={inputValue}>
	</div>
</div>

<Snackbar color={snackbarColor} timeout={2000} bind:this={snackbar} text={snackbarText} />

<style lang='scss'>
  .container {
    display: grid;
    place-items: center;
    width: 100vw;
    height: 100vh;
  }
  .container input {
    padding: 20px 170px;
    background: #2e2d35;
    border: 2px solid #232228;
    border-radius: 10px;
    outline: none;
    font-size: 1.5em;
    color: white;
    transition: .3s;
    text-align: center;
  }
  .container input:hover {
    filter: brightness(1.2);
  }
  .container input:focus {
    box-shadow: 2px 2px 2px rgba(0,0,0,0.6);
    transform: scale(1.02);
  }
</style>
