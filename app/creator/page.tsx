"use client"
import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { useWallet, Wallet } from "@aptos-labs/wallet-adapter-react";
import { useState } from "react";

export default function Home() {
  
    const wallet = useWallet(); 
    const [walletAddress, setWalletAddress] = useState(""); 

    return (
    <Dialog>
      <DialogTrigger asChild>
        <Button variant="outline">Become a Creator</Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-[425px]">
        <DialogHeader>
          <DialogTitle>Provide Information</DialogTitle>
          <DialogDescription>Tell us more about yourself</DialogDescription>
        </DialogHeader>
        <div className="grid gap-4 py-4">
          <div className="grid grid-cols-4 items-center gap-4">
            <Label htmlFor="name" className="text-right">
              Name
            </Label>
            <Input id="name" value="Pedro Duarte" className="col-span-3" />
          </div>
          <div className="grid grid-cols-4 items-center gap-4">
            <Label htmlFor="username" className="text-right">
              Username
            </Label>
            <Input id="username" value="@peduarte" className="col-span-3" />
          </div>
          <div className="grid grid-cols-4 items-center gap-4">
            <Label htmlFor="username" className="text-right">
                Wallet Address
            </Label>
            <Input id="username" className="col-span-3" value={ (wallet && wallet.connected) ? wallet.account?.address : "" }  onChange={(event) => {setWalletAddress(event.target.value)}}/>
          </div>
        </div>
        <DialogFooter>
          <Button type="submit">Save changes</Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
