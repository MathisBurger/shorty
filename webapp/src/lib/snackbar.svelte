<script lang="ts">
	let show = false;
	export let text: string;
	export let color: string;
	export let timeout: number;

	export function showMessage() {
		show = true;
		setTimeout(() => {
			show = false;
		}, timeout);
	}
</script>

{#if show}
	<div class='snackbar' style={`background: ${color};`}>
		{text}
	</div>
{/if}

<style lang='scss'>
	.snackbar {
		position: absolute;
		z-index: 20;
		width: 200px;
		height: 50px;
		bottom: 10px;
		left: 50%;
		transform: translateX(-50%);
		text-align: center;
		color: white;
		font-size: 1.5em;
		display: grid;
		place-items: center;
		font-family: "Roboto", sans-serif;
		border-radius: 5px;
		animation-name: slideIn;
		animation-duration: 0.6s;
		animation-fill-mode: forwards;
	}

	@keyframes slideIn {
		0% {
			bottom: -50px;
		}
		100% {
			bottom: 10px;
		}
  }
</style>
