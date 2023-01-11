<template>
	<view class="container">
		<Navbar :hideBtn="true" title="我的资产" bgColor="#fff" :h5Show="false" :fixed="false"></Navbar>
		<view class="Wallet">
			<view class="topWallet">
				<view class="title">
					<view class="">总资产约(合USDT)</view>
					<!-- <image src="" mode=""></image> -->
				</view>
				<view class="money">10235678.15844</view>
				<view class="about">≈10235678.15844</view>
			</view>
			<view class="bottomWallet">
				<image class="img" src="../../static/images/captcha/point-active.png" mode=""></image>
				<view class="search">搜索资产</view>
				<label>
					<checkbox class="u-checkbox" value="false" /><text>隐藏为0的币种</text>
				</label>
			</view>
		</view>

	<view class="wrap">

			<view class="list">
				<view class="line"></view>
				<view class="title">BTC</view>
				<u-grid :col="3">
					<u-grid-item>
						<view class="grid-text">可用</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
					<u-grid-item>
						<view class="grid-text">冻结</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
					<u-grid-item>
						<view class="grid-text">待释放</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
				</u-grid>
			</view>

			<view class="list">
				<view class="line"></view>
				<view class="title">BTC</view>
				<u-grid :col="3">
					<u-grid-item>
						<view class="grid-text">可用</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
					<u-grid-item>
						<view class="grid-text">冻结</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
					<u-grid-item>
						<view class="grid-text">待释放</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
				</u-grid>
			</view>

			<view class="list">
				<view class="line"></view>
				<view class="title">BTC</view>
				<u-grid :col="3">
					<u-grid-item>
						<view class="grid-text">可用</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
					<u-grid-item>
						<view class="grid-text">冻结</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
					<u-grid-item>
						<view class="grid-text">待释放</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
				</u-grid>
			</view>

			<view class="list">
				<view class="line"></view>
				<view class="title">BTC</view>
				<u-grid :col="3">
					<u-grid-item>
						<view class="grid-text">可用</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
					<u-grid-item>
						<view class="grid-text">冻结</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
					<u-grid-item>
						<view class="grid-text">待释放</view>
						<view class="grid-M">0.456852</view>
					</u-grid-item>
				</u-grid>
			</view>
		
		</view>
		
	
	</view>
</template>

<script>
import Navbar from '@/components/navbar/Navbar'
export default {
	components: {
		Navbar
	},

}
</script>

<style scoped lang="scss">
	.container {
		width: 750rpx;
		min-height: 100vh;
		height: auto;
		background: #eeeeee;

		.line {
			margin: 20rpx auto;
			width: 92%;
			height: 1px;
			background: #d0d0d0;
		}

		.wrap {
			margin: 440rpx auto;
			width: 92%;

			.list {

				.title {
					line-height: 80rpx;
					font-weight: bold;
				}
			}
		}

		.Wallet {
			position: fixed;
			top: 100rpx;
			left: 4%;
			width: 92%;
			height: 340rpx;
			z-index: 100;

			.bottomWallet {
				font-size: 30rpx;
				display: flex;
				margin-top: 24rpx;

				.img {
					width: 40rpx;
					height: 40rpx;
				}

				.search {
					width: 54%;
					padding-left: 10rpx;
				}
			}

			.topWallet {
				background: #ffffff;
				border-radius: 8rpx;
				line-height: 68rpx;
				padding: 25rpx 0;

				.title {
					display: flex;
					padding-left: 34rpx;
				}

				.money {
					padding-left: 34rpx;
					font-size: 42rpx;
					font-weight: bold;
				}

				.about {
					padding-left: 34rpx;
				}
			}

		}
	}
</style>
