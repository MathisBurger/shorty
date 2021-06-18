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
	let addedRedirect: boolean = false;

	// This function is being executed, if you
	// type something in the input. It checks,
	// if you pressed enter. Then the string will
	// be checked and the shorted url is being generated.
	 async function onSubmit(e: KeyboardEvent) {
		if (e.key === "Enter") {
			if (!validateUrl(inputValue)) {

				snackbarText = "given url not valid";
				snackbarColor = "red";
				snackbar.showMessage();

			} else {
				toggleAddedRedirect();
			}
		}
	}

	// This function validates, weather the given url is a real
	// url, or only an random string.
	// It makes sure, that only valid url strings can be used .
	function validateUrl(url: string): boolean {
		return (url.includes("http://") || url.includes("https://")) &&
			url.includes(".");
	}

	// This function toggles the value
	// of the addedRedirect value.
	function toggleAddedRedirect(): void {
	 	addedRedirect = !addedRedirect;
	}

</script>

{#if addedRedirect}
	<Overlay message='nice' shortURL='https://mathis-burger.de' />
{/if}

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
