<div class='navbar'>
	<div class='navbar-menu'>
		<a href='/'>Home</a>
		<a href='/about'>About</a>
		<a href='/privacy'>privacy</a>
	</div>
</div>


<style lang='scss'>
	.navbar {
		width: 99vw;
		height: 70px;
		background: #2e2d35;
		border-radius: 10px;
	}
	.navbar-menu {
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		gap: 20px;
	}
	.navbar-menu a {
		color: white;
		font-family: "Roboto", sans-serif;
		font-size: 1.4em;
		cursor: pointer;
		transition: .3s;
		text-decoration: none;
	}
	.navbar-menu a:hover {
		color: #acacac;
	}
</style>
