<script setup>
import { Head, Link } from "@inertiajs/vue3";

// defineProps({
//     canLogin: {
//         type: Boolean,
//     },
//     canRegister: {
//         type: Boolean,
//     },
//     laravelVersion: {
//         type: String,
//         required: true,
//     },
//     phpVersion: {
//         type: String,
//         required: true,
//     },
// });
</script>

<template>
    <div
        class="flex flex-col items-center justify-center min-h-screen py-6 bg-gray-100"
    >
        <div class="sm:fixed sm:top-0 sm:right-0 p-6 text-right">
            <Link
                v-if="$page.props.auth.user && !$page.props.auth.user?.is_admin"
                :href="route('dashboard')"
                class="font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500"
            >
                Dashboard
            </Link>
            <Link
                v-if="$page.props.auth.user?.is_admin"
                :href="route('admin.dashboard')"
                class="font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500"
            >
                Admin Dashboard
            </Link>

            <template v-if="!$page.props.auth.user">
                <Link
                    :href="route('login')"
                    class="font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500"
                >
                    Log in
                </Link>

                <Link
                    :href="route('register')"
                    class="ml-4 font-semibold text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500"
                >
                    Register
                </Link>
            </template>
        </div>

        <div class="text-3xl font-semibold text-center text-gray-800 mb-6">
            Welcome to Our Pet Shop!
        </div>
        <div class="flex items-center justify-center">
            <img
                src="https://i.pinimg.com/originals/37/fe/25/37fe2578c2a1ad5714090c7331eb4c96.jpg"
                alt="Pet Shop Logo"
                class="w-32 h-32 rounded-full object-cover"
            />
        </div>
        <div class="mt-8">
            <Link
                :href="route('dashboard')"
                class="px-6 py-3 text-white bg-indigo-600 rounded hover:bg-indigo-500"
            >
                View Our Goods
            </Link>
        </div>
    </div>
</template>
