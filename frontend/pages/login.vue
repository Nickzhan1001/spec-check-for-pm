<template>
  <main class="min-h-screen bg-[#FAFAFA]">
    <section class="mx-auto flex min-h-screen w-full max-w-[1920px] flex-col lg:flex-row">
      <div class="relative z-10 w-full bg-[#0D6E6E] text-white lg:w-[640px]">
        <div class="absolute inset-0 overflow-hidden">
          <div class="absolute inset-0 bg-[#0D6E6E18]" />
          <div class="pointer-events-none absolute inset-0">
            <div class="absolute -left-[42px] -top-[66px] h-[240px] w-[240px] rounded-full bg-[#FFFFFF08]" />
            <div class="absolute left-[502px] top-[766px] h-[160px] w-[160px] rounded-full bg-[#FFFFFF06]" />
            <div class="absolute -left-[59px] top-[585px] h-[240px] w-[240px] rounded-full bg-[#0000001D]" />
            <div class="absolute left-[480px] top-[120px] h-[160px] w-[160px] rounded-full bg-[#FFFFFF0F]" />
            <div class="absolute left-[507px] top-[179px] h-[180px] w-[180px] rounded-full bg-[#FFFFFF19]" />
          </div>
        </div>
        <div class="relative z-10 flex h-full flex-col items-center justify-center px-10 py-20 text-center">
          <div class="flex h-20 w-20 items-center justify-center rounded-full bg-white/20">
            <svg
              aria-hidden="true"
              viewBox="0 0 24 24"
              class="h-10 w-10"
              fill="none"
              stroke="currentColor"
              stroke-width="1.8"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path d="m7.5 4.27 9 5.15" />
              <path d="M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z" />
              <path d="m3.3 7 8.7 5 8.7-5" />
              <path d="M12 22V12" />
            </svg>
          </div>
          <h1 class="mt-6 text-[36px] font-bold tracking-[0.5px]">
            昶青碼頭系統
          </h1>
          <p class="mt-2 text-[16px] tracking-[1px] text-white/75 font-['DM Sans']">
            changChing Wharf System
          </p>
          <div class="mt-5 h-[2px] w-12 bg-white/40" />
          <p class="mt-5 text-[15px] text-white/70">
            出貨・收貨・退貨作業管理平台
          </p>
        </div>
      </div>
      <div class="relative z-0 flex flex-1 items-center justify-center bg-white px-6 py-12 lg:px-20 lg:py-[60px]">
        <div class="w-full max-w-[400px]">
          <div class="space-y-2">
            <h2 class="text-[32px] font-bold text-[#1A1A1A]">登入系統</h2>
            <p class="text-[14px] text-[#666666]">請輸入您的帳號與密碼</p>
          </div>
          <form class="mt-7 space-y-5">
            <label class="block space-y-1.5">
              <span class="text-[13px] font-medium text-[#1A1A1A]">帳號</span>
              <div class="flex h-12 items-center gap-2.5 rounded-lg border border-[#E5E5E5] bg-white px-4">
                <svg
                  aria-hidden="true"
                  viewBox="0 0 24 24"
                  class="h-[18px] w-[18px] text-[#AAAAAA]"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="1.8"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                >
                  <path d="M20 21a8 8 0 0 0-16 0" />
                  <circle cx="12" cy="7" r="4" />
                </svg>
                <input
                  type="text"
                  autocomplete="username"
                  placeholder="請輸入帳號"
                  class="h-full w-full border-0 bg-transparent text-[14px] text-[#1A1A1A] placeholder:text-[#AAAAAA] focus:outline-none font-['DM Sans']"
                />
              </div>
            </label>
            <label class="block space-y-1.5">
              <span class="text-[13px] font-medium text-[#1A1A1A]">密碼</span>
              <div class="flex h-12 items-center gap-2.5 rounded-lg border border-[#E5E5E5] bg-white px-4">
                <svg
                  aria-hidden="true"
                  viewBox="0 0 24 24"
                  class="h-[18px] w-[18px] text-[#AAAAAA]"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="1.8"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                >
                  <rect x="3" y="11" width="18" height="10" rx="2" />
                  <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                </svg>
                <input
                  type="password"
                  autocomplete="current-password"
                  placeholder="請輸入密碼"
                  class="h-full w-full border-0 bg-transparent text-[14px] text-[#1A1A1A] placeholder:text-[#AAAAAA] focus:outline-none font-['DM Sans']"
                />
                <svg
                  aria-hidden="true"
                  viewBox="0 0 24 24"
                  class="h-[18px] w-[18px] text-[#AAAAAA]"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="1.8"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                >
                  <path d="M9.9 9.9a3 3 0 0 0 4.2 4.2" />
                  <path d="M10.7 5.1a10.5 10.5 0 0 1 9 6.9 10.5 10.5 0 0 1-1.7 3.3" />
                  <path d="M6.2 6.2A10.5 10.5 0 0 0 2.3 12a10.5 10.5 0 0 0 9.7 7.1c1.6 0 3.2-.4 4.5-1.1" />
                  <path d="M3 3l18 18" />
                </svg>
              </div>
            </label>
            <button
              type="submit"
              class="flex h-12 w-full items-center justify-center gap-2 rounded-lg bg-[#0D6E6E] text-[15px] font-semibold text-white transition hover:bg-[#0A5858]"
            >
              <svg
                aria-hidden="true"
                viewBox="0 0 24 24"
                class="h-[18px] w-[18px]"
                fill="none"
                stroke="currentColor"
                stroke-width="1.8"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4" />
                <path d="M10 17l5-5-5-5" />
                <path d="M15 12H3" />
              </svg>
              登入
            </button>
            <div class="flex justify-center">
              <button type="button" class="text-[13px] font-medium text-[#0D6E6E]">
                忘記密碼？
              </button>
            </div>
          </form>
        </div>
      </div>
    </section>
  </main>
</template>

<script setup lang="ts">
definePageMeta({
  layout: false,
})
</script>
