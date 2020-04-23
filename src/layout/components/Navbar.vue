<template>
  <div class="navbar">
    <hamburger :is-active="sidebar.opened" class="hamburger-container" @toggleClick="toggleSideBar" />

    <breadcrumb class="breadcrumb-container" />

    <div class="right-menu">
      <el-dropdown size="medium" class="avatar-container" trigger="click">
        <div class="avatar-wrapper">
          <!-- <img :src="avatar+'?imageView2/1/w/80/h/80'" class="user-avatar"> -->
          <img src="data:image/png;base64,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" class="user-avatar">
          <i class="el-icon-caret-bottom" />
        </div>
        <el-dropdown-menu slot="dropdown" class="user-dropdown">
          <router-link to="/">
            <el-dropdown-item>
              首页
            </el-dropdown-item>
          </router-link>
          <el-dropdown-item divided @click.native="logout">
            <span style="display:block;">登出</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Breadcrumb from '@/components/Breadcrumb'
import Hamburger from '@/components/Hamburger'

export default {
  components: {
    Breadcrumb,
    Hamburger
  },
  computed: {
    ...mapGetters([
      'sidebar',
      'avatar'
    ])
  },
  methods: {
    toggleSideBar() {
      this.$store.dispatch('app/toggleSideBar')
    },
    async logout() {
      await this.$store.dispatch('user/logout')
      this.$router.push(`/login?redirect=${this.$route.fullPath}`)
    }
  }
}
</script>

<style lang="scss" scoped>
.navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0,21,41,.08);

  .hamburger-container {
    line-height: 46px;
    height: 100%;
    float: left;
    cursor: pointer;
    transition: background .3s;
    -webkit-tap-highlight-color:transparent;

    &:hover {
      background: rgba(0, 0, 0, .025)
    }
  }

  .breadcrumb-container {
    float: left;
  }

  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 100%;
      font-size: 18px;
      color: #5a5e66;
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background .3s;

        &:hover {
          background: rgba(0, 0, 0, .025)
        }
      }
    }

    .avatar-container {
      margin-right: 30px;

      .avatar-wrapper {
        margin-top: 5px;
        position: relative;

        .user-avatar {
          cursor: pointer;
          width: 38px;
          height: 38px;
          border-radius: 10px;
        }

        .el-icon-caret-bottom {
          cursor: pointer;
          position: absolute;
          right: -20px;
          top: 25px;
          font-size: 12px;
        }
      }
    }
  }
}
</style>
