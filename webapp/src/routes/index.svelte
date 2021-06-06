<svelte:head>
	<title>Shorty</title>
</svelte:head>

<script lang="ts">
	import Navbar from "../lib/navbar.svelte";
	import Snackbar from "../lib/snackbar.svelte";

	let snackbar;
	let snackbarText: string;
	let inputValue: string = '';

	function onSubmit(e: KeyboardEvent): void {
		if (e.key === "Enter") {
			snackbar.showMessage();
		}
	}

	function validateUrl(url: string): boolean {
		return false;
	}
</script>

<div>
	<Navbar />
	<div class='container'>
		<input type='text' on:keydown={e => onSubmit(e)} value={inputValue}>
	</div>
</div>

<Snackbar color='green' timeout={2000} bind:this={snackbar} text={snackbarText} />

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
