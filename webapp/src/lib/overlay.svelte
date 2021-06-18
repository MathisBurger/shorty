<script lang="ts">
	export let message: string;
	export let shortURL: string;

</script>

<div class='overlay'>
	{message}<br>
	{shortURL}
</div>

<style lang='scss'>
  .overlay{
    position: absolute;
    top: 50%;
    left: 50%;
		transform: translate(-50%, -50%);
    width: 50%;
    height: 50%;
    z-index: 10;
    background-color: rgb(69, 65, 65);
		border-radius: 10px;
  }
</style>
