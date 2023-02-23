<template>
	<view class="content">
    <view class="mix-list-cell" :class="border" @click="eventClick" hover-class="cell-hover"  :hover-stay-time="50">
			<text
				v-if="icon"
				class="cell-icon yticon"
				:style="[{ color: iconColor, }]"
				:class="icon"
			></text>
			<image v-if="image" :src="image" class="cell-image"></image>
			<text class="cell-tit clamp">{{title}}</text>
			<text v-if="tips" class="cell-tip">{{tips}}</text>
			<text class="cell-more yticon"
				:class="typeList[navigateType]"
			></text>
		</view>
  </view>
</template>

<script>
	/**
	 *  简单封装了下， 可以在此基础上进行扩展使用
	 *  比如加入image， iconSize可控等
	 */
	export default {
		data() {
			return {
				typeList: {
					left: 'icon-zuo',
					right: 'icon-you',
					up: 'icon-shang',
					down: 'icon-xia'
				},
			}
		},
		props: {
			icon: {
				type: String,
				default: ''
			},
			image: {
				type: String,
				default: ''
			},
			title: {
				type: String,
				default: '设置'
			},
			tips: {
				type: String,
				default: ''
			},
			navigateType: {
				type: String,
				default: 'right'
			},
			border: {
				type: String,
				default: 'b-b'
			},
			hoverClass: {
				type: String,
				default: 'cell-hover'
			},
			iconColor: {
				type: String,
				default: '#333'
			}
		},
		methods: {
			eventClick(){
				this.$emit('eventClick');
			}
		},
	}
</script>

<style lang='scss'>

	.icon .mix-list-cell.b-b:after{
		left: 90rpx;
	}
	.mix-list-cell{
		display:flex;
		align-items:center;
		padding: 20rpx 30rpx;
		line-height:60rpx;
		position:relative;
    border-bottom: 1rpx solid #e6ebee;
		&.cell-hover{
			background:#fafafa;
		}
		&.b-b:after{
			left: 30rpx;
		}

		.cell-icon{
			align-self:center;
			width:56rpx;
			max-height:60rpx;
			font-size:38rpx;
		}
		.cell-more{
			align-self: center;
			font-size:30rpx;
			color: #f8f8f8;
			margin-left:10rpx;
		}
		.cell-tit{
			flex: 1;
			font-size: 28rpx;
			color: #14191F;
			margin-right:10rpx;
		}
		.cell-tip{
			font-size: 30rpx + 2rpx;
			color: #8B9FAA;
		}
		.cell-image{
			width: 50rpx;
			height: 50rpx;
			margin-right: 20rpx;
		}
	}
</style>
