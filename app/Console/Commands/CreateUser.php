<?php

namespace App\Console\Commands;

use App\Models\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;

class CreateUser extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'create:user';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a new user';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $name = $this->ask('What is your name?');
        $email = $this->ask('What is your email?');
        $isAdmin = $this->confirm('Are you an admin?', true);
        $pass = Hash::make($this->secret('What is the password?'));

        User::create(
            [
                'name' => $name,
                'email' => $email,
                'is_admin' => $isAdmin,
                'password' => $pass,
            ]
        );

        $this->info('User created successfully.');
    }
}
